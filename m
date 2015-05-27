From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: CPU LED trigger: add hooks to generic code so that it works on
 x86
Date: Wed, 27 May 2015 09:43:43 +0200
Message-ID: <20150527074343.GI19282@twins.programming.kicks-ass.net>
References: <20150527065712.GA4415@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:49036 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751384AbbE0Hnu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 27 May 2015 03:43:50 -0400
Content-Disposition: inline
In-Reply-To: <20150527065712.GA4415@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org

On Wed, May 27, 2015 at 08:57:12AM +0200, Pavel Machek wrote:
> 
> CPU LED trigger hooks are currently hidden in arm-specific code, which
> means that this trigger only works on arm. Add it to the generic
> code, so that it works on x86, too.

And why do we want to go and slow down the idle loop for everyone?
