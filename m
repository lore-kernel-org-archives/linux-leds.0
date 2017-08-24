From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 3/4] leds: pca955x: add GPIO support
Date: Thu, 24 Aug 2017 22:03:59 +0200
Message-ID: <c403ddf1-a26c-1ccc-f722-eacac6115c34@gmail.com>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
 <1502199760-763-4-git-send-email-clg@kaod.org> <20170811134757.GA22561@amd>
 <9330f31a-110c-8398-8cd1-764f8dd358e9@kaod.org> <20170811153742.GA31267@amd>
 <b585f234-6ad6-e63f-f4ec-f7d1efaf83ca@kaod.org> <20170812084213.GA20383@amd>
 <4a6d3c67-c7ac-664c-2506-8c5e0530a2c1@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:34708 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753246AbdHXUEn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Aug 2017 16:04:43 -0400
In-Reply-To: <4a6d3c67-c7ac-664c-2506-8c5e0530a2c1@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>

Hi Cedric,

On 08/24/2017 01:30 PM, Cédric Le Goater wrote:
> On 08/12/2017 10:42 AM, Pavel Machek wrote:
>> Hi!
>>
>>>>>>> +static u8 pca955x_read_input(struct i2c_client *client, int n)
>>>>>>> +{
>>>>>>> +	return (u8)i2c_smbus_read_byte_data(client, n);
>>>>>>> +}
>>>>>>
>>>>>> Is the cast needed? Should you attempt to handle errors?
>>>>>
>>>>> ah. this is a left over. I can fix in a resend.
>>>>
>>>> No need to resend just for this.
>>>>
>>>> Should you WARN_ON() if the read_byte_data returns < 0 or something?
>>>>
>>>> https://linuxtv.org/downloads/v4l-dvb-internals/device-drivers/API-i2c-smbus-read-byte-data.html
>>>
>>> I don't think so as this is just to read the gpio value. 
>>>
>>> I suppose that the i2c layer will output some errors before 
>>> if it catches some invalid state.
>>
>> Normally its driver's job to output errors. (Same for write).
> 
> ok. I can respin the patchset with an extra patch adding checks
> for I2C errors (see below). In which order would you want that, 
> before the gpio support or after ? 

I'd prefer an incremental patch. The patch set has received 10
days of testing and the merge window is imminent. Not the best
moment to respin the for-next branch.

-- 
Best regards,
Jacek Anaszewski
