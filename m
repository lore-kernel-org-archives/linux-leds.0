From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: CPU LED trigger: add hooks to generic code so that it works on
 x86
Date: Wed, 27 May 2015 14:17:23 +0200
Message-ID: <20150527121723.GA3644@twins.programming.kicks-ass.net>
References: <20150527065712.GA4415@amd>
 <20150527074343.GI19282@twins.programming.kicks-ass.net>
 <20150527074757.GB1254@amd>
 <20150527080831.GJ19282@twins.programming.kicks-ass.net>
 <20150527084718.GA4991@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37849 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537AbbE0MRb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 27 May 2015 08:17:31 -0400
Content-Disposition: inline
In-Reply-To: <20150527084718.GA4991@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org

On Wed, May 27, 2015 at 10:47:18AM +0200, Pavel Machek wrote:
> 
> Distros should not enable this, IMO. But I don't think overhead is
> that big in either case.

Coming back from idle there might not be any cache, and you're adding at
least 1 more cache miss for loading cpu_trig -- those hurt. Looking at
that code, in case of !trig, you do a pointless function call before
bailing.

The thing is, there already is too much code in the wake from idle path,
adding more is not my favourite thing.

One thing you could do is wrap the call to ledtrig_cpu() in a
static_key, that way all we do is add some i$ pollution, but at least we
avoid the data cache miss when there's nothing to do.
