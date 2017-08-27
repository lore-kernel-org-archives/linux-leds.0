From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 2/2] leds: gpio: Allow LED to retain state at shutdown
Date: Sun, 27 Aug 2017 13:01:15 +0200
Message-ID: <3b89ad70-7024-b4ac-bf4e-49a02d12da51@gmail.com>
References: <20170825063503.31577-1-andrew@aj.id.au>
 <20170825063503.31577-3-andrew@aj.id.au> <20170825073239.GB15494@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:37634 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751135AbdH0LCA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Aug 2017 07:02:00 -0400
In-Reply-To: <20170825073239.GB15494@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, rpurdie@rpsys.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org

Hi Andrew,

On 08/25/2017 09:32 AM, Pavel Machek wrote:
> On Fri 2017-08-25 16:05:03, Andrew Jeffery wrote:
>> In some systems, such as BMCs, we want to retain the state of LEDs
>> across a reboot of the BMC whilst the host remains up.
> 
> I'd spell out what BMC is...

I agree with Pavel. Please give the expansion of the acronym
in both DT patch and the driver commit message.

> 
> Otherwise series looks good.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

-- 
Best regards,
Jacek Anaszewski
