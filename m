From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: LMU: Fix lm3632 dt binding example
Date: Mon, 29 Apr 2019 12:30:58 -0500
Message-ID: <20190429173058.GA27596@bogus>
References: <20190405141907.3348-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190405141907.3348-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

On Fri, 5 Apr 2019 09:19:07 -0500, Dan Murphy wrote:
> Fix the lm3632 dt binding examples as the LCM enable GPIOs
> are defined as enable GPIOs per the regulator/lm363x-regulator.txt
> bindings document.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/mfd/ti-lmu.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
