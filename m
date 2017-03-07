From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH V2 1/2] leds: core: add OF variants of LED registering
 functions
Date: Tue, 7 Mar 2017 20:30:42 +0100
Message-ID: <8b220e23-f138-55ff-67c5-26520328c9b3@gmail.com>
References: <20170306051945.14857-1-zajec5@gmail.com>
 <20170307120547.GA2740@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:32774 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756051AbdCGT7K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Mar 2017 14:59:10 -0500
Received: by mail-wr0-f196.google.com with SMTP id g10so1586661wrg.0
        for <linux-leds@vger.kernel.org>; Tue, 07 Mar 2017 11:59:09 -0800 (PST)
In-Reply-To: <20170307120547.GA2740@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

On 03/07/2017 01:05 PM, Pavel Machek wrote:
> On Mon 2017-03-06 06:19:44, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> These new functions allow passing an additional device_node argument
>> that will be internally set for created LED device. Thanks to this LED
>> core code and triggers will be able to access DT node for reading extra
>> info.
>>
>> The easiest solution for achieving this was reworking old functions to
>> more generic ones & adding simple defines for API compatibility.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> Both patches: Acked-by: Pavel Machek <pavel@ucw.cz>

Applied, thanks.

-- 
Best regards,
Jacek Anaszewski
