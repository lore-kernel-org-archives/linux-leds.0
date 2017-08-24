From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: Re: [PATCH v3 3/4] leds: pca955x: add GPIO support
Date: Thu, 24 Aug 2017 23:32:10 +0200
Message-ID: <aceecf43-2958-eb82-d2c3-f660f1f8e511@kaod.org>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
 <1502199760-763-4-git-send-email-clg@kaod.org> <20170811134757.GA22561@amd>
 <9330f31a-110c-8398-8cd1-764f8dd358e9@kaod.org> <20170811153742.GA31267@amd>
 <b585f234-6ad6-e63f-f4ec-f7d1efaf83ca@kaod.org> <20170812084213.GA20383@amd>
 <4a6d3c67-c7ac-664c-2506-8c5e0530a2c1@kaod.org>
 <c403ddf1-a26c-1ccc-f722-eacac6115c34@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c403ddf1-a26c-1ccc-f722-eacac6115c34-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 08/24/2017 10:03 PM, Jacek Anaszewski wrote:
> Hi Cedric,
> 
> On 08/24/2017 01:30 PM, Cédric Le Goater wrote:
>> On 08/12/2017 10:42 AM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>>>>> +static u8 pca955x_read_input(struct i2c_client *client, int n)
>>>>>>>> +{
>>>>>>>> +	return (u8)i2c_smbus_read_byte_data(client, n);
>>>>>>>> +}
>>>>>>>
>>>>>>> Is the cast needed? Should you attempt to handle errors?
>>>>>>
>>>>>> ah. this is a left over. I can fix in a resend.
>>>>>
>>>>> No need to resend just for this.
>>>>>
>>>>> Should you WARN_ON() if the read_byte_data returns < 0 or something?
>>>>>
>>>>> https://linuxtv.org/downloads/v4l-dvb-internals/device-drivers/API-i2c-smbus-read-byte-data.html
>>>>
>>>> I don't think so as this is just to read the gpio value. 
>>>>
>>>> I suppose that the i2c layer will output some errors before 
>>>> if it catches some invalid state.
>>>
>>> Normally its driver's job to output errors. (Same for write).
>>
>> ok. I can respin the patchset with an extra patch adding checks
>> for I2C errors (see below). In which order would you want that, 
>> before the gpio support or after ? 
> 
> I'd prefer an incremental patch. The patch set has received 10
> days of testing and the merge window is imminent. Not the best
> moment to respin the for-next branch.

OK. The patch applies on top of the patchset. I will give it some 
more testing before sending.

Thanks,

C.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
