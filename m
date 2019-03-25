From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] dt: lm3532: Add lm3532 dt doc and update ti_lmu doc
Date: Mon, 25 Mar 2019 07:54:00 +0000
Message-ID: <20190325075400.GX4731@dell>
References: <20190321142838.22985-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190321142838.22985-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, 21 Mar 2019, Dan Murphy wrote:

> Add the lm3532 device tree documentation.
> Remove lm3532 device tree reference from the ti_lmu devicetree
> documentation.
> 
> With the addition of the dedicated lm3532 documentation the device
> can be removed from the ti_lmu.txt.
> 
> The reason for this is that the lm3532 dt documentation now defines
> the ability to control LED output strings against different control
> banks or groups multiple strings to be controlled by a single control
> bank.
> 
> Another addition was for ALS lighting control and configuration.  The
> LM3532 has a feature that can take in the ALS reading from 2 separate
> ALS devices and adjust the brightness on the strings that are configured
> to support this feature.
> 
> Finally the device specific properties were moved to the parent node as these
> properties are not control bank configurable.  These include the runtime ramp
> and the ALS configuration.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v5 - Moved ramping range to below property definition, updated keyboard label -
> https://lore.kernel.org/patchwork/patch/1050412/
> 
> v4 - Appended "ti," to TI specific properties, add enable gpio documentation,
> removed an example, moved ramp to optional parent properties - https://lore.kernel.org/patchwork/patch/1050122/
> v3 - No changes - https://lore.kernel.org/patchwork/patch/1049026/
> v2 - Fixed ramp-up and ramp-down properties, removed hard coded property values,
> added ranges for variable properties, I did not change the label - https://lore.kernel.org/patchwork/patch/1048805/
> 
>  .../devicetree/bindings/leds/leds-lm3532.txt  | 101 ++++++++++++++++++
>  .../devicetree/bindings/mfd/ti-lmu.txt        |  20 ----
>  2 files changed, 101 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3532.txt

Same for this patch:

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
