From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: leds: Add bindings for lm3697 driver
Date: Mon, 20 Aug 2018 12:57:49 -0500
Message-ID: <20180820175749.GA13428@bogus>
References: <20180817151528.21623-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180817151528.21623-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

On Fri, 17 Aug 2018 10:15:27 -0500, Dan Murphy wrote:
> Add the device tree bindings for the lm3697
> LED driver for backlighting and display.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v5 - Fix the comment for the example - https://lore.kernel.org/patchwork/patch/975060/
> 
> v4 - Removed HVLED definition in favor of HVLED place definition - https://lore.kernel.org/patchwork/patch/974812/
> v3 - Updated subject with prefered title - https://lore.kernel.org/patchwork/patch/972337/
> v2 - Fixed subject and patch commit message - https://lore.kernel.org/patchwork/patch/971326/
> 
>  .../devicetree/bindings/leds/leds-lm3697.txt  | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
