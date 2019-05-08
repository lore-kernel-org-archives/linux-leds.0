From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: mfd: Add lm36274 bindings to ti-lmu
Date: Wed, 8 May 2019 12:52:31 +0100
Message-ID: <20190508115231.GN31645@dell>
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-3-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190507201159.13940-3-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, 07 May 2019, Dan Murphy wrote:

> Add the LM36274 backlight driver with regulator support.
> This is a multi-function device for backlight applications.
> 
> Backlight properties will be documented in it's a supplemental
> bindings document.
> 
> Regulator support is documented in the regulator/lm363x-regulator.txt
> 
> http://www.ti.com/lit/ds/symlink/lm36274.pdf
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti-lmu.txt        | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
