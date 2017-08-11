From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: Re: [PATCH v3 3/4] leds: pca955x: add GPIO support
Date: Fri, 11 Aug 2017 18:26:19 +0200
Message-ID: <b585f234-6ad6-e63f-f4ec-f7d1efaf83ca@kaod.org>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
 <1502199760-763-4-git-send-email-clg@kaod.org> <20170811134757.GA22561@amd>
 <9330f31a-110c-8398-8cd1-764f8dd358e9@kaod.org> <20170811153742.GA31267@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170811153742.GA31267@amd>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 08/11/2017 05:37 PM, Pavel Machek wrote:
> Hi!
> 
>>> with minor comments below.
>>>
>>>> @@ -125,6 +130,7 @@ struct pca955x_led {
>>>>  	struct led_classdev	led_cdev;
>>>>  	int			led_num;	/* 0 .. 15 potentially */
>>>>  	char			name[32];
>>>> +	u32			type;
>>>
>>> u32 is highly non-standard here. enum pca955x_led_type?
>>>
>>>
>>>> +/*
>>>> + * Read the INPUT register, which contains the state of LEDs.
>>>> + */
>>>> +static u8 pca955x_read_input(struct i2c_client *client, int n)
>>>> +{
>>>> +	return (u8)i2c_smbus_read_byte_data(client, n);
>>>> +}
>>>
>>> Is the cast needed? Should you attempt to handle errors?
>>
>> ah. this is a left over. I can fix in a resend.
> 
> No need to resend just for this.
> 
> Should you WARN_ON() if the read_byte_data returns < 0 or something?
> 
> https://linuxtv.org/downloads/v4l-dvb-internals/device-drivers/API-i2c-smbus-read-byte-data.html

I don't think so as this is just to read the gpio value. 

I suppose that the i2c layer will output some errors before 
if it catches some invalid state.

C.

>>>> +#ifndef _DT_BINDINGS_LEDS_PCA955X_H
>>>> +#define _DT_BINDINGS_LEDS_PCA955X_H
>>>> +
>>>> +#define PCA955X_TYPE_NONE         0
>>>> +#define PCA955X_TYPE_LED          1
>>>> +#define PCA955X_TYPE_GPIO         2
>>>
>>> And make these into the new enum pca955x_led_type?
>>
>> These are used in the device tree bindings, so we should keep the u32
>> I think.
> 
> Aha, ok, makes sense.
> 									Pavel
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
