From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v2 2/3] mfd: rt5033: Add RT5033 Flash led sub device
Date: Tue, 13 Oct 2015 17:03:51 +0900
Message-ID: <561CBAE7.1070300@samsung.com>
References: <1444655578-19806-1-git-send-email-ingi2.kim@samsung.com>
 <1444655578-19806-3-git-send-email-ingi2.kim@samsung.com>
 <20151013070610.GO17172@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49356 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932145AbbJMIDx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 13 Oct 2015 04:03:53 -0400
In-reply-to: <20151013070610.GO17172@x1>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Lee Jones,

Okay, I'm try to remove needless part and resend it
Thanks for the review

Thank you

On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 16:06, Lee Jones wrote:
> On Mon, 12 Oct 2015, Ingi Kim wrote:
>=20
>> This patch adds rt5033-led sub device to support it.
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> ---
>>  drivers/mfd/rt5033.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
>> index d60f916..b7f374b 100644
>> --- a/drivers/mfd/rt5033.c
>> +++ b/drivers/mfd/rt5033.c
>> @@ -40,13 +40,17 @@ static const struct regmap_irq_chip rt5033_irq_c=
hip =3D {
>>  };
>> =20
>>  static const struct mfd_cell rt5033_devs[] =3D {
>> -	{ .name =3D "rt5033-regulator", },
>>  	{
>> +		.name =3D "rt5033-regulator",
>> +	}, {
>=20
> There's no need for this change.  Please remove it.
>=20
>>  		.name =3D "rt5033-charger",
>>  		.of_compatible =3D "richtek,rt5033-charger",
>>  	}, {
>>  		.name =3D "rt5033-battery",
>>  		.of_compatible =3D "richtek,rt5033-battery",
>> +	}, {
>> +		.name =3D "rt5033-led",
>> +		.of_compatible =3D "richtek,rt5033-led",
>=20
> For when you resubmit with the hunk above removed:
>=20
> Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
>>  	},
>>  };
>> =20
>=20
