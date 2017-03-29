From: Darren Hart <dvhart@infradead.org>
Subject: Re: Stable branch dell-laptop-changes-for-4.12
Date: Wed, 29 Mar 2017 12:25:20 -0700
Message-ID: <20170329192520.GA15472@localhost.localdomain>
References: <992db922-efe5-ed64-2af0-7f3f7d7a4ec9@poczta.onet.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:45163 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752592AbdC2TZY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Mar 2017 15:25:24 -0400
Content-Disposition: inline
In-Reply-To: <992db922-efe5-ed64-2af0-7f3f7d7a4ec9@poczta.onet.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <anjack@poczta.onet.pl>
Cc: Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Sun, Mar 26, 2017 at 10:18:45AM +0200, Jacek Anaszewski wrote:
> Hi Andy, Darren,
> 
> I've created stable branch dell-laptop-changes-for-4.12
> 
> in the repository
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
> 
> for you to merge due to the conflict in linux-next:
> 
> Today's linux-next merge of the leds tree got a conflict in:
> 
>   drivers/platform/x86/dell-laptop.c
> 
> between commit:
> 
>   573eedacfba3 ("platform/x86: dell-*: Call new led hw_changed API on
> kbd brightness change")
> 
> from the drivers-x86 tree and commit:
> 
>   44319ab7e0ed ("platform/x86: dell-laptop: import
> dell_micmute_led_set() from drivers/leds/dell-led.c")
> 
> from the leds tree.
> 

Thank you Jacek. I've queued this to testing and will update for-next provided
it all comes back clean from testing.


-- 
Darren Hart
VMware Open Source Technology Center
