From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: core: avoid error message when a USB LED device is
 unplugged
Date: Fri, 22 Jan 2016 23:03:45 +0100
Message-ID: <56A2A741.5040102@gmail.com>
References: <569E9F98.3070802@gmail.com> <56A1EC2C.6050808@samsung.com>
 <56A293A5.9020503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:36943 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753876AbcAVWEG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jan 2016 17:04:06 -0500
Received: by mail-wm0-f47.google.com with SMTP id n5so1567564wmn.0
        for <linux-leds@vger.kernel.org>; Fri, 22 Jan 2016 14:04:05 -0800 (PST)
In-Reply-To: <56A293A5.9020503@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

On 01/22/2016 09:40 PM, Heiner Kallweit wrote:
> Am 22.01.2016 um 09:45 schrieb Jacek Anaszewski:
>> Hi Heiner,
>>
>> Could you rebase this patch on the top of devel branch
>> of LED git, please?
>>
>> I am getting an error while applying it:
>>
>> error: short SHA1 19e1e60 is ambiguous.
>> fatal: sha1 information is lacking or useless (drivers/leds/led-core.c).
>> Repository lacks necessary blobs to fall back on 3-way merge.
>>
>> It may have happened that you had some patches that are not in mainline
>> kernel in the repository you produced the patch from. It is also
>> possible that this is an issue with the git version I am using, so this
>> would clarify the situation.
>>
> Reason is the changed comment as it affects the context of this patch.
> Will rebase it and resend.

Changed comment should only result in a conflict. This was not
the case, the crucial line was:

error: short SHA1 19e1e60 is ambiguous

It occurs also with git 2.1.4. Nevertheless, version 2 applies
smoothly.

Thanks,
Jacek Anaszewski
