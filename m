From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 3/3] leds: Add ktd2692 flash LED driver
Date: Tue, 12 May 2015 10:44:27 -0700
Message-ID: <CAK5ve-LTuQWS59m=O2YyO1bAryAezYhre4eW3ZA34sraJ53AZA@mail.gmail.com>
References: <1431419877-28339-1-git-send-email-ingi2.kim@samsung.com>
 <1431419877-28339-4-git-send-email-ingi2.kim@samsung.com> <5551F4AE.9050900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5551F4AE.9050900-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, "sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Tue, May 12, 2015 at 5:40 AM, Jacek Anaszewski
<j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi Ingi,
>
> On 05/12/2015 10:37 AM, Ingi Kim wrote:
>>
>> This patch adds a driver to support the ktd2692 flash LEDs.
>> ktd2692 can control flash current by ExpressWire interface.
>>
>> Signed-off-by: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Reviewed-by: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   drivers/leds/Kconfig        |   9 +
>>   drivers/leds/Makefile       |   1 +
>>   drivers/leds/leds-ktd2692.c | 443
>> ++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 453 insertions(+)
>>   create mode 100644 drivers/leds/leds-ktd2692.c
>
>
> Acked-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>

Merged, thanks.
-Bryan

> --
> Best Regards,
> Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
