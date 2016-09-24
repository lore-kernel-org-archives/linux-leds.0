From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 2/2] leds: Add driver for NCP5623 3-channel I2C LED
 driver
Date: Sat, 24 Sep 2016 20:45:37 +0200
Message-ID: <de530f7a-987d-ae2d-ecb8-f7765fbde85c@gmail.com>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-3-git-send-email-florian.vaussard@heig-vd.ch>
 <d6dfc1aa-941d-fdbb-5fda-74c85b571bc5@gmail.com> <20160924120022.GB8696@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36466 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752150AbcIXSqT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Sep 2016 14:46:19 -0400
In-Reply-To: <20160924120022.GB8696@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Florian Vaussard <florian.vaussard@gmail.com>, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>

On 09/24/2016 02:00 PM, Pavel Machek wrote:
> Hi!
>
>> Instead I propose the following:
>>
>> n_iled_max =
>>      31 - (priv->led_iref * 2400 / priv->leds_max_current +
>>            !!(priv->led_iref * 2400 % priv->leds_max_current))
>>
>
> div_round_up?

Exactly. Thanks.

-- 
Best regards,
Jacek Anaszewski
