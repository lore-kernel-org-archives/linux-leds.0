From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: triggers: add invert to heartbeat
Date: Thu, 08 Oct 2015 14:05:22 +0200
Message-ID: <56165C02.3090106@samsung.com>
References: <f72b41d0cf24fa74ea74799fea87b05ff727e621.1444292878.git.jiri.prchal@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:65398 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755408AbbJHMFZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2015 08:05:25 -0400
In-reply-to: <f72b41d0cf24fa74ea74799fea87b05ff727e621.1444292878.git.jiri.prchal@aksignal.cz>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, cooloney@gmail.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org

On 10/08/2015 10:32 AM, Jiri Prchal wrote:
> This patcht adds possibility to invert heartbeat blinking. The inverted LED
> is more time ON then OFF.
> It's because it looks better when the heartbeat LED is next to other LED
> which is most time ON.
> The invert value is exported same way via sysfs in file invert like
> oneshot. I get inspiration from this trigger.
>
> Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>

Adjusted commit message format a bit and merged, thanks.

-- 
Best Regards,
Jacek Anaszewski
