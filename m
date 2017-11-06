From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 1/1] leds: Add driver for PC Engines APU/APU2 LEDs
Date: Mon, 6 Nov 2017 22:11:18 +0100
Message-ID: <d230be9f-e47c-35d5-5942-a1b4d65d536b@gmail.com>
References: <20171103013807.GA13284@poseidon>
 <4ec288c4-2d03-fb2a-04ae-9c901c74219f@gmail.com>
 <545b36bf-9577-c2bf-4896-1d19b50f9f9e@mizrahi.com.ve>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:55590 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753442AbdKFVMR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Nov 2017 16:12:17 -0500
Received: by mail-wr0-f196.google.com with SMTP id l8so9920559wre.12
        for <linux-leds@vger.kernel.org>; Mon, 06 Nov 2017 13:12:17 -0800 (PST)
In-Reply-To: <545b36bf-9577-c2bf-4896-1d19b50f9f9e@mizrahi.com.ve>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alan Mizrahi <alan@mizrahi.com.ve>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

On 11/04/2017 02:21 AM, Alan Mizrahi wrote:
> On 2017-11-04 04:48, Jacek Anaszewski wrote:
>> Hi Alan,
>>
>> Thanks for addressing my remarks.
>> You omitted one detail, though. Please refer below.
>>
>> On 11/03/2017 02:38 AM, Alan Mizrahi wrote:
> 
>>> +static const struct dmi_system_id apu_led_dmi_table[] __initdata = {
> 
>>
>> s/__initdata/__initconst/
>>
>> I can fix it up by myself, if you agree.
> 
> I missed that one.
> I'm fine either way, I can also submit another patch if you prefer.

Fixed it up and applied to the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
