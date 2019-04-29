From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: mfd: Add lm36274 bindings to ti-lmu
Date: Mon, 29 Apr 2019 13:00:25 -0500
Message-ID: <20190429180025.GA15562@bogus>
References: <20190410133833.28859-1-dmurphy@ti.com>
 <20190410133833.28859-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190410133833.28859-2-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

On Wed, 10 Apr 2019 08:38:29 -0500, Dan Murphy wrote:
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
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - No changes - https://lore.kernel.org/patchwork/patch/1058776/
> 
>  .../devicetree/bindings/mfd/ti-lmu.txt        | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
