From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v4 01/12] DT: leds: Improve description of flash
 LEDs related properties
Date: Wed, 08 Apr 2015 10:48:27 +0300
Message-ID: <5524DD4B.6040607@linux.intel.com>
References: <1427809965-25540-1-git-send-email-j.anaszewski@samsung.com> <1427809965-25540-2-git-send-email-j.anaszewski@samsung.com> <20150403120910.GL20756@valkosipuli.retiisi.org.uk> <551E8DEA.5070205@samsung.com> <20150403203730.GA13009@amd> <CAK5ve-KR81cNrJnPj_XUkNvctsEYLDGb58qTVaOOAYJnoZTGXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK5ve-KR81cNrJnPj_XUkNvctsEYLDGb58qTVaOOAYJnoZTGXg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Bryan,

Bryan Wu wrote:
> On Fri, Apr 3, 2015 at 1:37 PM, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:
>> Hi!
>>
>>>>> +- flash-timeout-us : Timeout in microseconds after which the flash
>>>>> +                     LED is turned off. If omitted this will default to the
>>>>> +                maximum timeout allowed by the device.
>>>>>
>>>>>
>>>>>  Examples:
>>>>
>>>> Pavel pointed out that the brightness between maximum current and the
>>>> maximum *allowed* another current might not be noticeable,leading a
>>>> potential spelling error to cause the LED being run at too high current.
>>>
>>> Where did he point this out? Do you think about the current version
>>> of the leds/common.txt documentation or there was some other message,
>>> that I don't see?
>>
>> Date: Thu, 2 Apr 2015 22:30:44 +0200
>> From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>> To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
>> Subject: Re: [PATCHv3] media: i2c/adp1653: devicetree support for adp1653
>>
>>> Besides, I can't understand your point. Could you express it in other
>>> words, please?
>>
>> Typo in device tree would cause hardware damage. But idea. Make the
>> properties mandatory.
>>                                                                 Pavel
> 
> I don't quite follow there. I think Pavel acked this patch right? So
> what's left to hold here?

LED flash controllers are capable of providing more current than the
LEDs attached to them can withstand without hardware damage. This is the
reason the maximum current limits lower than the LED controller maximums
are there.

Pavel, quite rightly so in my opinion, is suggesting these properties
are made mandatory. A typo in the DT source could cause the controller
maximum current used instead of LED maximum which is often lower. That
kind of a problem would easily go unnoticed since there isn't
necessarily any perceivable change in the functionality of the board.

You'd only notice later on, when the LEDs stop working.

-- 
Regards,

Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
