From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 01/12] DT: leds: Improve description of flash LEDs
 related properties
Date: Tue, 7 Apr 2015 18:20:08 -0700
Message-ID: <CAK5ve-KR81cNrJnPj_XUkNvctsEYLDGb58qTVaOOAYJnoZTGXg@mail.gmail.com>
References: <1427809965-25540-1-git-send-email-j.anaszewski@samsung.com>
 <1427809965-25540-2-git-send-email-j.anaszewski@samsung.com>
 <20150403120910.GL20756@valkosipuli.retiisi.org.uk> <551E8DEA.5070205@samsung.com>
 <20150403203730.GA13009@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150403203730.GA13009@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Apr 3, 2015 at 1:37 PM, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:
> Hi!
>
>> >>+- flash-timeout-us : Timeout in microseconds after which the flash
>> >>+                     LED is turned off. If omitted this will default to the
>> >>+                maximum timeout allowed by the device.
>> >>
>> >>
>> >>  Examples:
>> >
>> >Pavel pointed out that the brightness between maximum current and the
>> >maximum *allowed* another current might not be noticeable,leading a
>> >potential spelling error to cause the LED being run at too high current.
>>
>> Where did he point this out? Do you think about the current version
>> of the leds/common.txt documentation or there was some other message,
>> that I don't see?
>
> Date: Thu, 2 Apr 2015 22:30:44 +0200
> From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> Subject: Re: [PATCHv3] media: i2c/adp1653: devicetree support for adp1653
>
>> Besides, I can't understand your point. Could you express it in other
>> words, please?
>
> Typo in device tree would cause hardware damage. But idea. Make the
> properties mandatory.
>                                                                 Pavel

I don't quite follow there. I think Pavel acked this patch right? So
what's left to hold here?

Thanks,
-Bryan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
