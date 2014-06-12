From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/5] Fix various issues with leds-pwm
Date: Thu, 12 Jun 2014 19:21:34 +0100
Message-ID: <20140612182134.GN23430@n2100.arm.linux.org.uk>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk> <CAK5ve-JijCvD8cZMpx+zG7YAjce3hnhpwTHCJr+zzfMKmJPt=g@mail.gmail.com> <20140407213337.GL7528@n2100.arm.linux.org.uk> <CAK5ve-KMLvxZgwFiks7eQHdBfakfMUPqUiuY0+KFmGLat8VhPA@mail.gmail.com> <20140612171206.GA12123@n2100.arm.linux.org.uk> <CAK5ve-+j75g_cTDHAEF3F9fqHQqe9iGFQ+XfssS=dNn0sa+bmg@mail.gmail.com> <20140612180333.GM23430@n2100.arm.linux.org.uk> <CAK5ve-+5de8L5qZfton6LTgvBQDpD5Wo2hF8xUx99usH-ZD6ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:56232 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750716AbaFLSVn (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Thu, 12 Jun 2014 14:21:43 -0400
Content-Disposition: inline
In-Reply-To: <CAK5ve-+5de8L5qZfton6LTgvBQDpD5Wo2hF8xUx99usH-ZD6ZA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>

On Thu, Jun 12, 2014 at 11:16:50AM -0700, Bryan Wu wrote:
> Indeed, let me refresh my brain from working on a strange bug recently.
> 
> The root cause is I didn't realize the merge window is open and forget
> to send out pull request.  My original plan is to sent them out during
> 3.16 merge window. I just did.
> 
> And you previous email confused me, so I misunderstood the 3.16 merge
> window is 3.17-rc1 which should be 3.16-rc1. God damn it, I messed up.
> 
> So actually everything is fine, I just send out the pull request.
> Your first critical patch was merged during 3.15 cycle and the rest
> for 3.16 merge window are in my pull request.
> 
> We are good now, right? -:((

I hope so...  thanks.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
