using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ImageThumnails
/// </summary>
public class ImageThumnails
{
    /// <summary>
    /// Scales the correct image size depending on the viewing size and the original image size.
    /// Use this to get an image that will fit into your viewing rectangle with the correct ratio.
    /// </summary>
    /// <param name="desiredWidth">The desired width, most likely the width of your image viewing rectangle.</param>
    /// <param name="desiredHeight">The desired height, most likely the width of your image viewing rectangle.</param>
    /// <param name="originalWidth">The width of the image.</param>
    /// <param name="originalHeight">The height of the image.</param>
    /// <param name="scaledWidth">Returns the scaled width for display.</param>
    /// <param name="scaledHeight">Returns the scaled height for display.</param>
    public static void GetImageRatio(int desiredWidth, int desiredHeight,
             int originalWidth, int originalHeight,
             ref int scaledWidth, ref int scaledHeight)
    {
        float pRatio = (float)desiredWidth / desiredHeight;
        float imRatio = (float)originalWidth / originalHeight;

        if (desiredWidth >= originalWidth && desiredHeight >= originalHeight)
        {
            scaledWidth = originalWidth;
            scaledHeight = originalHeight;
        }
        else if (desiredWidth > originalWidth && desiredHeight < originalHeight)
        {
            scaledHeight = desiredHeight;
            scaledWidth = (int)(desiredHeight * imRatio);
        }
        else if (desiredWidth < originalWidth && desiredHeight > originalHeight)
        {
            scaledWidth = desiredWidth;
            scaledHeight = (int)(desiredWidth / imRatio);
        }
        else if (desiredWidth <= originalWidth && desiredHeight <= originalHeight)
        {
            if (desiredWidth >= desiredHeight)
            {
                //width image
                if (originalWidth >= originalHeight && imRatio >= pRatio)
                {
                    scaledWidth = desiredWidth;
                    scaledHeight = (int)(desiredWidth / imRatio);
                }
                else
                {
                    scaledHeight = desiredHeight;
                    scaledWidth = (int)(desiredHeight * imRatio);
                }
            }
            else
            {
                //width image
                if (originalWidth < originalHeight && imRatio < pRatio)
                {
                    scaledHeight = desiredHeight;
                    scaledWidth = (int)(desiredHeight * imRatio);
                }
                else // height image
                {
                    scaledWidth = desiredWidth;
                    scaledHeight = (int)(desiredWidth / imRatio);
                }
            }
        }
    }

    /// <summary>
    /// Generates a thumbnail image given the full image and the viewing rectangle.
    /// </summary>
    /// <param name="fullImage">The object containing the full image to be thumbnailed.</param>
    /// <param name="thumbSize">The viewing size that the thumbnail must scale down to.</param>
    /// <returns></returns>
    public static Image GenerateThumbnail(Image fullImage, Size thumbSize)
    {
        if (fullImage == null)
            return null;

        int desiredWidth = 0;
        int desiredHeight = 0;

        GetImageRatio(thumbSize.Width, thumbSize.Height, fullImage.Width, fullImage.Height,
             ref desiredWidth, ref desiredHeight);

        if (desiredHeight < 1)
            desiredHeight = 1;

        if (desiredWidth < 1)
            desiredWidth = 1;

        Bitmap bmpTarget = new Bitmap(desiredWidth, desiredHeight, PixelFormat.Format32bppArgb);
        using (Graphics gfx = Graphics.FromImage(bmpTarget))
        {
            gfx.InterpolationMode = InterpolationMode.HighQualityBicubic;
            gfx.SmoothingMode = SmoothingMode.HighQuality;
            gfx.PixelOffsetMode = PixelOffsetMode.HighQuality;
            gfx.CompositingQuality = CompositingQuality.HighQuality;
            gfx.DrawImage(fullImage, 0, 0, desiredWidth, desiredHeight);
        }

        return bmpTarget;
    }


}
