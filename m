From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH 1/2] dt: bindings: as3645a: Update dt node example with standard
Date: Wed, 13 Dec 2017 18:29:29 +0200
Message-ID: <2178454.bfcIRroSfr@avalon>
References: <20171212215024.30116-1-dmurphy@ti.com> <4192002.yKJgEXTVKE@avalon> <90a1c908-3170-6956-8983-f9d88234cc07@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44927 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750916AbdLMQ30 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Dec 2017 11:29:26 -0500
In-Reply-To: <90a1c908-3170-6956-8983-f9d88234cc07@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, sakari.ailus@iki.fi, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Dan,

On Wednesday, 13 December 2017 14:55:03 EET Dan Murphy wrote:
> On 12/13/2017 02:09 AM, Laurent Pinchart wrote:
> > On Tuesday, 12 December 2017 23:50:23 EET Dan Murphy wrote:
> >> Update the DT binding to remove the device name from
> >> the DT parent node as well as removing the device
> >> name from the label.  The LED label will be generated
> >> based off the id name stored in the local driver so
> >> the LED function can be indicated in the label DT
> >> entry.
> >> 
> >> Also removed the indentation on the example.
> > 
> > This makes the patch a bit harder to review and seems to be a matter of
> > style.
> 
> I debated whether to remove the extra tabs.  The changes below came from
> comments from a recent LED driver I submitted.
> 
> >> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >> ---
> >> 
> >>  .../devicetree/bindings/leds/ams,as3645a.txt       | 36 +++++++++-------
> >>  1 file changed, 18 insertions(+), 18 deletions(-)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> >> b/Documentation/devicetree/bindings/leds/ams,as3645a.txt index
> >> fc7f5f9f234c..122aa7165cf3 100644
> >> --- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> >> +++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> >> @@ -58,22 +58,22 @@ label		: The label of the indicator LED.
> > 
> > I believe you should expand the documentation of the label property to
> > detail how it should be formed. It's nice to update the example, but the
> > bindings should be understandable without it.
> 
> OK. I will add a reference to
> Documentation/devicetree/bindings/leds/common.txt
> 
> label formation will be undergoing some changes.  I wanted to make sure
> there were some good examples in the LED tree for other developers to
> reference.
> 
> >>  Example
> >>  =======
> >> 
> >> -	as3645a@30 {
> >> -		compatible = "ams,as3645a";
> >> -		#address-cells = <1>;
> >> -		#size-cells = <0>;
> >> -		reg = <0x30>;
> >> -		flash@0 {
> >> -			reg = <0x0>;
> >> -			flash-timeout-us = <150000>;
> >> -			flash-max-microamp = <320000>;
> >> -			led-max-microamp = <60000>;
> >> -			ams,input-max-microamp = <1750000>;
> >> -			label = "as3645a:flash";
> >> -		};
> >> -		indicator@1 {
> >> -			reg = <0x1>;
> >> -			led-max-microamp = <10000>;
> >> -			label = "as3645a:indicator";
> >> -		};
> >> +led-controller@30 {
> > 
> > This change looks fine to me.
> > 
> >> +	compatible = "ams,as3645a";
> >> +	#address-cells = <1>;
> >> +	#size-cells = <0>;
> >> +	reg = <0x30>;
> >> +	led@0 {
> > 
> > What's the rationale for changing the node name here ? It should be
> > explained in the commit message, and in the DT bindings documentation.
> 
> In my patch to the DT maintainers Rob H indicated
> 
> "Actually, it should be led-controller and led or leds be used for the
> LED child nodes (and gpio-led or pwd-led bindings)"
> 
> Here is the patch that the node naming conventions took place
> 
> https://patchwork.kernel.org/patch/10093757

OK, that makes sense to me.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >> +		reg = <0x0>;
> >> +		flash-timeout-us = <150000>;
> >> +		flash-max-microamp = <320000>;
> >> +		led-max-microamp = <60000>;
> >> +		ams,input-max-microamp = <1750000>;
> >> +		label = "flash";
> >> 
> >>  	};
> >> 
> >> +	led@1 {
> >> +		reg = <0x1>;
> >> +		led-max-microamp = <10000>;
> >> +		label = "indicator";
> >> +	};
> >> +};

-- 
Regards,

Laurent Pinchart
