From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v2] dt: bindings: as3645a: Fix the example node
Date: Fri, 15 Dec 2017 14:26:46 -0600
Message-ID: <20171215202646.4l2swy4h7ruhqu3m@rob-hp-laptop>
References: <20171208155514.7696-1-dmurphy@ti.com>
 <50214549-63d1-f92e-d4e7-dc6533477d83@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:45655 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755650AbdLOU0s (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Dec 2017 15:26:48 -0500
Content-Disposition: inline
In-Reply-To: <50214549-63d1-f92e-d4e7-dc6533477d83@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Fri, Dec 08, 2017 at 09:56:18AM -0600, Dan Murphy wrote:
> Resent to include DT maintainers
> 
> On 12/08/2017 09:55 AM, Dan Murphy wrote:
> > Fix the address-cells and size-cells example node
> > to reflect to the correct representation.
> > 
> > Signed-off-by: Dan Murphy <dmurphy@ti.com>
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> > ---
> > 
> > v2 - Moved compatible to be first in the node - https://patchwork.kernel.org/patch/10092937/
> > 
> >  Documentation/devicetree/bindings/leds/ams,as3645a.txt | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> > index fdc40e354a64..fc7f5f9f234c 100644
> > --- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> > +++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> > @@ -59,10 +59,10 @@ Example
> >  =======
> >  
> >  	as3645a@30 {
> 
> Rob
> 
> Here is an example of the device name being part of the node name.
> 
> Should this be changed as well to leds@30?

Yes, but I misspoke earlier and it should be "led-controller@30"

That can be a separate patch though, so for this one:

Reviewed-by: Rob Herring <robh@kernel.org>
