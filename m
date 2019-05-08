From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] dt-bindings: mfd: LMU: Fix lm3632 dt binding example
Date: Wed, 8 May 2019 11:53:39 +0100
Message-ID: <20190508105339.GP3995@dell>
References: <20190405141907.3348-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190405141907.3348-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, 05 Apr 2019, Dan Murphy wrote:

> Fix the lm3632 dt binding examples as the LCM enable GPIOs
> are defined as enable GPIOs per the regulator/lm363x-regulator.txt
> bindings document.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/mfd/ti-lmu.txt | 4 ++--

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
