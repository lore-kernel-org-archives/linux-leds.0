From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: mfd: LMU: Add
 ti,brightness-resolution
Date: Mon, 29 Apr 2019 12:33:38 -0500
Message-ID: <20190429173338.GA32250@bogus>
References: <20190405142855.3969-1-dmurphy@ti.com>
 <20190405142855.3969-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190405142855.3969-2-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

On Fri, 5 Apr 2019 09:28:51 -0500, Dan Murphy wrote:
> Add ti,brightness-resolution to the TI LMU binding to define
> whether the device uses 8-bit brightness or 11-bit brightness.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - New patch.  Add brightness resolution to ti-lmu.txt.  See patch comments
> for context. - https://lore.kernel.org/patchwork/patch/1054501/
> 
>  Documentation/devicetree/bindings/mfd/ti-lmu.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
