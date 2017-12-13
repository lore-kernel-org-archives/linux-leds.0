From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] leds: as3645a: Fix checkpatch warnings
Date: Wed, 13 Dec 2017 23:32:18 +0200
Message-ID: <11486565.PIGBh3m9bD@avalon>
References: <20171212215011.30066-1-dmurphy@ti.com> <98df06ef-9ee4-02b1-6d6b-f10b911a8d71@gmail.com> <799ae164-701a-87ce-fadf-8278f01c10d6@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47560 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753744AbdLMVcO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Dec 2017 16:32:14 -0500
In-Reply-To: <799ae164-701a-87ce-fadf-8278f01c10d6@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, pavel@ucw.cz, sakari.ailus@iki.fi, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Dan,

On Wednesday, 13 December 2017 22:49:38 EET Dan Murphy wrote:
> On 12/13/2017 02:43 PM, Jacek Anaszewski wrote:
> > On 12/13/2017 09:41 PM, Dan Murphy wrote:
> >> On 12/13/2017 02:29 PM, Jacek Anaszewski wrote:
> >>> Hi Dan,
> >>> 
> >>> checkpatch.pl doesn't want to be mentioned in the patch subject :-)
> >> 
> >> Ack
> >> 
> >>> "WARNING: A patch subject line should describe the change not the tool
> >>> that found it"
> >>> 
> >>> Preferably I'd see two separate patches.
> >> 
> >> So you want me to split them up? I have no issue with that.
> > 
> > Yeah, it will be easier to come up with concise but meaningful
> > subjects.

Well, given that one change splits a line that is too long and the other one 
merges two lines that fit within the limit we could come up with a message 
that covers both :-) This is nitpicking though, it doesn't matter much. I have 
no issue with a patch that has some "while at it" portion anyway as long as 
it's minor (I personally include white space fixes in patches that touch the 
related code for instance).

> When I split these up can I add your Acked-by to each patch or would you
> prefer to resend your Acked-by for each patch?

Assuming you make no mistake, you can keep my ack :-) It will of course not 
cover the commit message then.

> >>> Also, line length limit for the commit description is 75 characters.
> >>> Please use whole available space.

-- 
Regards,

Laurent Pinchart
