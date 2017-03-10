From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH] leds/trigger/activity: add a system activity LED trigger
Date: Fri, 10 Mar 2017 07:44:34 +0100
Message-ID: <20170310064434.GA32449@1wt.eu>
References: <1486856514-9634-1-git-send-email-w@1wt.eu>
 <5aefe1c8-1d3d-7056-4e51-f0a3d473d3bc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:18683 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750816AbdCJGoq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 10 Mar 2017 01:44:46 -0500
Content-Disposition: inline
In-Reply-To: <5aefe1c8-1d3d-7056-4e51-f0a3d473d3bc@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Jacek,

On Thu, Mar 09, 2017 at 09:48:39PM +0100, Jacek Anaszewski wrote:
> Hi Willy,
> 
> Thanks for the patch.
> 
> Unfortunately I'm getting following build break, while trying to
> test it on recent linux-next:
> 
> drivers/leds/trigger/ledtrig-activity.c: In function
> 'led_activity_function':
> drivers/leds/trigger/ledtrig-activity.c:67:14: error: implicit
> declaration of function 'cputime64_to_jiffies64'
> [-Werror=implicit-function-declaration]
>   curr_idle = cputime64_to_jiffies64(curr_idle);

Thanks for letting me know, I'll check this ASAP.

Cheers,
Willy
