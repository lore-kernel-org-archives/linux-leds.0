From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND v6 2/2] leds: tlc591xx: Driver for the TI 8/16
 Channel i2c LED driver
Date: Mon, 20 Apr 2015 10:49:07 -0700
Message-ID: <CAK5ve-Kk+e_CrnREbJEsigiSR_22SY11Gb-x=DPP+1vbxdPeNw@mail.gmail.com>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
 <1426630107-25057-3-git-send-email-andrew@lunn.ch> <5534C181.9060202@samsung.com>
 <20150420115959.GA8050@lunn.ch> <5534FA13.9090502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5534FA13.9090502-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matthew.Fatheree-REUqjI8E1xrQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Mon, Apr 20, 2015 at 6:07 AM, Jacek Anaszewski
<j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On 04/20/2015 01:59 PM, Andrew Lunn wrote:
>>
>> On Mon, Apr 20, 2015 at 11:06:09AM +0200, Jacek Anaszewski wrote:
>>>
>>> Hi Andrew,
>>>
>>> Very nice driver.
>>
>>
>> Thanks. I just hope it gets accepted into this merge window.
>>
>>> I have one question below.
>>
>>
> [...]
>>>>
>>>> +static int
>>>> +tlc591xx_configure(struct device *dev,
>>>> +                  struct tlc591xx_priv *priv,
>>>> +                  const struct tlc591xx *tlc591xx)
>>>> +{
>>>> +       unsigned int i;
>>>> +       int err = 0;
>>>> +
>>>> +       tlc591xx_set_mode(priv->regmap, MODE2_DIM);
>>>
>>>
>>> It seems that all leds will be initially turned on, in dim mode.
>>> This shouldn't be fixed and probably an optional 'led-mode' DT node
>>> property should be provided for defining the initial state. It would
>>> default to OFF if not present.
>>
>>
>> If you look further down, you will find
>>
>>>> +               priv->leds[reg].ldev.default_trigger =
>>>> +                       of_get_property(child, "linux,default-trigger",
>>>> NULL);
>>
>>
>> This is the normal way in DT to specify the default on/off/keep
>> current value/heartbeat etc.
>
>
> OK, I was initially thinking that initializing LED to MODE2_DIM
> turns the LED on.
>
> Acked-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>

Thanks, I merged it into my tree but it will target for next merge window.

-Bryan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
