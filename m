From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: ledtrig-ide-disk: Move ide_blink_delay to
 ledtrig_ide_activity()
Date: Tue, 19 Apr 2016 09:09:12 +0200
Message-ID: <5715D998.7030402@samsung.com>
References: <1460990446-24700-1-git-send-email-j.anaszewski@samsung.com>
 <20160418165715.4668ffa0@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:18316 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752023AbcDSHJR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 Apr 2016 03:09:17 -0400
In-reply-to: <20160418165715.4668ffa0@bbrezillon>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, rpurdie@rpsys.net, ezequiel@vanguardiasur.com.ar, pavel@ucw.cz

Hi Boris,

Thanks for the review, patch applied.

Best regards,
Jacek Anaszewski

On 04/18/2016 04:57 PM, Boris Brezillon wrote:
> On Mon, 18 Apr 2016 16:40:46 +0200
> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
>> Parameters delay_on and delay_off of led_trigger_blink_oneshot()
>> are pointers, to enable blink interval adjustment by LED class drivers
>> of the controllers that implement hardware blinking.
>>
>> Move ide_blink_delay variable to ledtrig_ide_activity() in order to
>> prevent the situation when adjustment committed by one LED class
>> driver influences blink interval of the software fallback blink feature,
>> that is applied to the drivers that don't implement blink_set op.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
