From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 5/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Wed, 8 May 2019 12:36:53 +0100
Message-ID: <20190508113653.GD31645@dell>
References: <20190506191614.25051-1-dmurphy@ti.com>
 <20190506191614.25051-6-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190506191614.25051-6-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: linux-leds@vger.kernel.org

On Mon, 06 May 2019, Dan Murphy wrote:

> The LM3697 is a single function LED driver. The single function LED
> driver needs to reside in the LED directory as a dedicated LED driver
> and not as a MFD device.  The device does have common brightness and ramp
> features and those can be accomodated by a TI LMU framework.
> 
> The LM3697 dt binding needs to be moved from the ti-lmu.txt and a dedicated
> LED dt binding needs to be added.  The new LM3697 LED dt binding will then
> reside in the Documentation/devicetree/bindings/leds directory and follow the
> current LED and general bindings guidelines.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v4 - Made assiciated ramp bindings changes and capitalization issue otherwise
> no change - https://lore.kernel.org/patchwork/patch/1068618/
> 
> v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058762/
> v2 - Made changes to reference ti,brightness-resolution to the ti-lmu.txt -
> https://lore.kernel.org/patchwork/patch/1054501/
> 
>  .../devicetree/bindings/leds/leds-lm3697.txt  | 73 +++++++++++++++++++

>  .../devicetree/bindings/mfd/ti-lmu.txt        | 27 +------

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
