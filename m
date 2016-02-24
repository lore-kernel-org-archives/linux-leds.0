From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: Re: [PATCH RFC 2/3] DT: leds: Add binding for the ISSI IS31FL32xx
 family of LED drivers
Date: Wed, 24 Feb 2016 13:57:13 -0500
Message-ID: <20160224135713.1eb1e234.drivshin.allworx@gmail.com>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
	<1456251445-23970-3-git-send-email-drivshin.allworx@gmail.com>
	<20160224011508.GA20343@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:35603 "EHLO
	mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757970AbcBXS5R (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2016 13:57:17 -0500
In-Reply-To: <20160224011508.GA20343@rob-hp-laptop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>

On Tue, 23 Feb 2016 19:15:08 -0600
Rob Herring <robh@kernel.org> wrote:

> On Tue, Feb 23, 2016 at 01:17:24PM -0500, David Rivshin (Allworx) wrote:
> > From: David Rivshin <drivshin@allworx.com>
> > 
> > This adds a binding description for the is31fl3236/35/18/16 I2C LED
> > drivers.
> > 
> > Signed-off-by: David Rivshin <drivshin@allworx.com>
> > ---
> >  .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 51 ++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt  
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, Rob. I just want to double check whether you noticed some
binding-related questions I had in the coverletter [1]. In hindsight
I should probably have included them in the patch comments as well so 
they'd show up in patchwork. For convenience, I'll repeat them here:

I choose to have 'reg' be 1-based in order to follow the hardware 
documentation. It seems 0-based is the normal choice, although HW
docs also usually use the 0-based numbering. Perhaps being consistent 
with other bindings is more important than being consistent with the 
datasheet's numbering?

I used the 'reg' property for the LED channel, as it seemed ePAPR 
required that name. I also considered naming the property 'chan', 
and not pretending that it represented a bus address at all (and
then removing the @n from the subnode names). That would solve the
'reg' question above as a side-effect, but would be inconstant with
other LED bindings (tca6507, pca963x, tlc59108, etc).

Note that the recently-added (and only in for-next) SN3218 driver 
uses a 0-based 'reg' property, and the SN3218 has the same HW doc
numbering as the IS31FL32xx family (indeed the IS31FL3218 appears 
to be a rebranded SN3218). So perhaps that sets the precedent if 
there was not one before?

Any guidance you could offer would be appreciated (especially since
this is my first from-scratch binding, and I'd rather not form any
bad habits).

[1] http://www.spinics.net/lists/linux-leds/msg05564.html
    http://thread.gmane.org/gmane.linux.leds/4530
