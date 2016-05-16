From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Brightness control irrespective of blink state.
Date: Mon, 16 May 2016 16:32:09 +0200
Message-ID: <5739D9E9.6060801@samsung.com>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1461881020-13964-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <57230B26.9010300@samsung.com> <572C5DEE.3070307@samsung.com>
 <CAAEAJfD_U1Z=wXQbK+DNdhZj5KEDkd3sK8mbBLNOvtKbZd1zYg@mail.gmail.com>
 <572CE1B0.8040001@daqri.com> <572CE715.6060504@gmail.com>
 <57309039.3060305@daqri.com> <5730A293.9050209@samsung.com>
 <5731ABB6.10607@daqri.com> <5731E194.1010004@samsung.com>
 <57321299.8090603@daqri.com> <5732FE64.6000907@samsung.com>
 <573336D9.7040105@daqri.com> <57345A59.5010607@samsung.com>
 <5735E2BD.4070405@daqri.com> <57399129.3020602@samsung.com>
 <5739CE75.80608@daqri.com> <5739D7CC.4040205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:42455 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751754AbcEPOcN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 May 2016 10:32:13 -0400
In-reply-to: <5739D7CC.4040205@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Pavel Machek <pavel@ucw.cz>, lkml <linux-kernel@vger.kernel.org>

On 05/16/2016 04:23 PM, Jacek Anaszewski wrote:
> On 05/16/2016 03:43 PM, Tony Makkiel wrote:
if (led_cdev->flags & LED_BLINK_SW) .
>>>
>>> LED_BLINK_SW flag would have to be cleared in led_stop_software_blink()
>>> and in the first two conditions in the led_timer_function().
>>>
>>
>> Yes, that will do with minimal changes. I tested the following, and
>> works.
>
> Fine, so could you please submit the patch officially?
> Before that, please rebase your code on top of LED tree or linux-next
> and change LED_BLINKING_SW to LED_BLINK_SW, to keep the same prefix for
> each blinking related definition.

Also please put it before LED_BLINK_ONESHOT.

-- 
Best regards,
Jacek Anaszewski
