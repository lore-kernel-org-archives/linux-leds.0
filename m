From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH] leds: ktd2692: Add missing of_node_put
Date: Tue, 17 Nov 2015 09:05:56 +0900
Message-ID: <564A6F64.1080101@samsung.com>
References: <1447124424-16525-1-git-send-email-ingi2.kim@samsung.com>
 <5649A92C.1020502@samsung.com>
 <CAL_JsqJWfSkZPEKaFdUQbQQb8m6MaKSHYMYOEf3U6frqGK_a3w@mail.gmail.com>
 <5649E87A.8030602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57871 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751236AbbKQAF6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2015 19:05:58 -0500
In-reply-to: <5649E87A.8030602@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Rob, Jacek

You're right,
It is better to remove "return 0"

Thanks for the review.

On 2015=EB=85=84 11=EC=9B=94 16=EC=9D=BC 23:30, Jacek Anaszewski wrote:
> On 11/16/2015 03:09 PM, Rob Herring wrote:
>> On Mon, Nov 16, 2015 at 4:00 AM, Jacek Anaszewski
>> <j.anaszewski@samsung.com> wrote:
>>> Hi Ingi, Rob,
>>>
>>> With this patch we will be leaking of_node when parsing succeeds.
>>> I think that "return 0" should be removed. I can remove it and appl=
y,
>>> provided that Rob's ack is still in force with this. Rob?
>>
>> Okay.
>=20
> Removed discussed line and applied, thanks.
>=20
>>> On 11/10/2015 04:00 AM, Ingi Kim wrote:
>>>>
>>>> The refcount of device_node increases after of_node_get() is calle=
d.
>>>> So, a break out of the loop requires of_node_put().
>>>>
>>>> This patch adds missing of_node_put() when loop breaks.
>>>>
>>>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>>>> ---
>>>>    drivers/leds/leds-ktd2692.c | 11 ++++++++---
>>>>    1 file changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd26=
92.c
>>>> index feca07b..dbf37ce 100644
>>>> --- a/drivers/leds/leds-ktd2692.c
>>>> +++ b/drivers/leds/leds-ktd2692.c
>>>> @@ -332,21 +332,26 @@ static int ktd2692_parse_dt(struct ktd2692_c=
ontext
>>>> *led, struct device *dev,
>>>>                                     &cfg->movie_max_microamp);
>>>>          if (ret) {
>>>>                  dev_err(dev, "failed to parse led-max-microamp\n"=
);
>>>> -               return ret;
>>>> +               goto err_parse_dt;
>>>>          }
>>>>
>>>>          ret =3D of_property_read_u32(child_node, "flash-max-micro=
amp",
>>>>                                     &cfg->flash_max_microamp);
>>>>          if (ret) {
>>>>                  dev_err(dev, "failed to parse flash-max-microamp\=
n");
>>>> -               return ret;
>>>> +               goto err_parse_dt;
>>>>          }
>>>>
>>>>          ret =3D of_property_read_u32(child_node, "flash-max-timeo=
ut-us",
>>>>                                     &cfg->flash_max_timeout);
>>>> -       if (ret)
>>>> +       if (ret) {
>>>>                  dev_err(dev, "failed to parse flash-max-timeout-u=
s\n");
>>>> +               goto err_parse_dt;
>>>> +       }
>>>> +
>>>> +       return 0;
>>>>
>>>> +err_parse_dt:
>>>>          of_node_put(child_node);
>>>>          return ret;
>>>>    }
>>>>
>>>
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe linux-kern=
el" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at  http://www.tux.org/lkml/
>>
>=20
>=20
