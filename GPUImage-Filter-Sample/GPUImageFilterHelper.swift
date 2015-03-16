//
//  GPUImageFilterHelper.swift
//  GPUImageHoge
//
//  Created by suzuki_kiwamu on 2015/03/16.
//  Copyright (c) 2015年 suzuki_kiwamu. All rights reserved.
//

import UIKit

class GPUImageFilterHelper: NSObject {
    override init() {}
    
    class var sharedInstance: GPUImageFilterHelper {
        struct Singleton {
            static let instance = GPUImageFilterHelper()
        }
        return Singleton.instance
    }
    
    
    func filterImageWithFilterType(type : FilterType , originImage : UIImage , valueO : CGFloat?) -> UIImage {
        switch type {
        case FilterType.FilterImgOrigin:
            return originImage.copy() as UIImage
        case FilterType.FilterImgContrast:
            return self.filterImageFilterImgContrast(originImage, contrast: valueO).copy() as UIImage
        case FilterType.FilterImgBrightness:
            return self.filterImageFilterImgBrightness(originImage, brightness: valueO).copy() as UIImage
        case FilterType.FilterImgSaturation:
            return self.filterImageFilterImgSaturation(originImage, saturation: valueO).copy() as UIImage
        case FilterType.FilterImggrayscale:
            return self.filterImageFilterImgGray(originImage).copy() as UIImage
        case FilterType.FilterImgMonochrome:
            return self.filterImageFilterImgMonochrome(originImage, intensity: valueO).copy() as UIImage
        case FilterType.FilterImgVignette:
            return self.filterImageFilterImgVignette(originImage).copy() as UIImage
        default:
            return originImage
        }
    }
    
    
    private func filterImageFilterImgContrast(originImage : UIImage , contrast: CGFloat?) -> UIImage {
        var GPUIMG : GPUImagePicture = GPUImagePicture(image: originImage)
        var contrastFilter : GPUImageContrastFilter = GPUImageContrastFilter()
        if let contrasts = contrast {
            contrastFilter.contrast = contrasts
        }
        else {
            contrastFilter.contrast = 0.5
        }
        GPUIMG.addTarget(contrastFilter)
        contrastFilter.useNextFrameForImageCapture()
        GPUIMG.processImage()
        var filterImage = contrastFilter.imageFromCurrentFramebuffer()
        return filterImage
    }
    
    
    private func filterImageFilterImgBrightness(originImage : UIImage , brightness: CGFloat?) -> UIImage {
        var GPUIMG : GPUImagePicture = GPUImagePicture(image: originImage)
        var contrastFilter : GPUImageBrightnessFilter = GPUImageBrightnessFilter()
        if let contrasts = brightness {
            contrastFilter.brightness = contrasts
        }
        else {
            contrastFilter.brightness = 0.5
        }
        GPUIMG.addTarget(contrastFilter)
        contrastFilter.useNextFrameForImageCapture()
        GPUIMG.processImage()
        var filterImage = contrastFilter.imageFromCurrentFramebuffer()
        return filterImage
    }
    
    
    private func filterImageFilterImgSaturation(originImage : UIImage , saturation: CGFloat?) -> UIImage {
        var GPUIMG : GPUImagePicture = GPUImagePicture(image: originImage)
        var contrastFilter : GPUImageSaturationFilter = GPUImageSaturationFilter()
        if let saturations = saturation {
            contrastFilter.saturation = saturations
        }
        else {
            contrastFilter.saturation = 0.5
        }
        GPUIMG.addTarget(contrastFilter)
        contrastFilter.useNextFrameForImageCapture()
        GPUIMG.processImage()
        var filterImage = contrastFilter.imageFromCurrentFramebuffer()
        return filterImage
    }
    
    
    private func filterImageFilterImgVignette(originImage : UIImage ) -> UIImage {
        var GPUIMG : GPUImagePicture = GPUImagePicture(image: originImage)
        var contrastFilter : GPUImageVignetteFilter = GPUImageVignetteFilter()
        GPUIMG.addTarget(contrastFilter)
        contrastFilter.useNextFrameForImageCapture()
        GPUIMG.processImage()
        var filterImage = contrastFilter.imageFromCurrentFramebuffer()
        return filterImage
    }
    
    
    private func filterImageFilterImgMonochrome(originImage : UIImage , intensity: CGFloat?) -> UIImage {
        var GPUIMG : GPUImagePicture = GPUImagePicture(image: originImage)
        var contrastFilter : GPUImageMonochromeFilter = GPUImageMonochromeFilter()
        if let inten = intensity {
            contrastFilter.intensity = inten
        }
        GPUIMG.addTarget(contrastFilter)
        contrastFilter.useNextFrameForImageCapture()
        GPUIMG.processImage()
        var filterImage = contrastFilter.imageFromCurrentFramebuffer()
        return filterImage
    }
    
    
    private func filterImageFilterImgGray(originImage : UIImage ) -> UIImage {
        var GPUIMG : GPUImagePicture = GPUImagePicture(image: originImage)
        var contrastFilter : GPUImageGrayscaleFilter = GPUImageGrayscaleFilter()
        GPUIMG.addTarget(contrastFilter)
        contrastFilter.useNextFrameForImageCapture()
        GPUIMG.processImage()
        var filterImage = contrastFilter.imageFromCurrentFramebuffer()
        return filterImage
    }
}