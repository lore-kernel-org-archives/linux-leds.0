From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Mon, 29 Apr 2019 12:34:20 -0500
Message-ID: <20190429173420.GA1273@bogus>
References: <20190405142855.3969-1-dmurphy@ti.com>
 <20190405142855.3969-4-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190405142855.3969-4-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

On Fri, 5 Apr 2019 09:28:53 -0500, Dan Murphy wrote:
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
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - Made changes to reference ti,brightness-resolution to the ti-lmu.txt -
> https://lore.kernel.org/patchwork/patch/1054501/
> 
>  .../devicetree/bindings/leds/leds-lm3697.txt  | 73 +++++++++++++++++++
>  .../devicetree/bindings/mfd/ti-lmu.txt        | 27 +------
>  2 files changed, 74 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
