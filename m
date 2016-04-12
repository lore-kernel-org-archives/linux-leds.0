From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 1/2] mtd: Uninline mtd_write_oob and move it to mtdcore.c
Date: Tue, 12 Apr 2016 15:35:52 -0300
Message-ID: <CAAEAJfCwdrf0bJXX4tu0e1XTHod03_yZ6CX23szAr6CgMwVjCQ@mail.gmail.com>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1460478395-25925-2-git-send-email-ezequiel@vanguardiasur.com.ar>
	<20160412201524.1549b844@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:38298 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933322AbcDLSfx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 14:35:53 -0400
Received: by mail-wm0-f52.google.com with SMTP id u206so39621973wme.1
        for <linux-leds@vger.kernel.org>; Tue, 12 Apr 2016 11:35:53 -0700 (PDT)
In-Reply-To: <20160412201524.1549b844@bbrezillon>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

On 12 April 2016 at 15:15, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 12 Apr 2016 13:26:34 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
>> There's no reason for having mtd_write_oob inlined in mtd.h header.
>> Move it to mtdcore.c where it belongs.
>
> I guess the real motivation here is to avoid including leds.h in
> mtd.h :).
>

Let's say that's what triggers this patch, but it still makes sense to =
do this
disregarding the led stuff.

>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>

Thanks,

>> ---
>>  drivers/mtd/mtdcore.c   | 12 ++++++++++++
>>  include/linux/mtd/mtd.h | 12 +-----------
>>  2 files changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 309625130b21..99d83f3331b0 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -997,6 +997,18 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t f=
rom, struct mtd_oob_ops *ops)
>>  }
>>  EXPORT_SYMBOL_GPL(mtd_read_oob);
>>
>> +int mtd_write_oob(struct mtd_info *mtd, loff_t to,
>> +                             struct mtd_oob_ops *ops)
>> +{
>> +     ops->retlen =3D ops->oobretlen =3D 0;
>> +     if (!mtd->_write_oob)
>> +             return -EOPNOTSUPP;
>> +     if (!(mtd->flags & MTD_WRITEABLE))
>> +             return -EROFS;
>> +     return mtd->_write_oob(mtd, to, ops);
>> +}
>> +EXPORT_SYMBOL_GPL(mtd_write_oob);
>> +
>>  /*
>>   * Method to access the protection register area, present in some f=
lash
>>   * devices. The user data is one time programmable but the factory =
data is read
>> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
>> index 771272187316..ef9fea4fc400 100644
>> --- a/include/linux/mtd/mtd.h
>> +++ b/include/linux/mtd/mtd.h
>> @@ -283,17 +283,7 @@ int mtd_panic_write(struct mtd_info *mtd, loff_=
t to, size_t len, size_t *retlen,
>>                   const u_char *buf);
>>
>>  int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_=
ops *ops);
>> -
>> -static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
>> -                             struct mtd_oob_ops *ops)
>> -{
>> -     ops->retlen =3D ops->oobretlen =3D 0;
>> -     if (!mtd->_write_oob)
>> -             return -EOPNOTSUPP;
>> -     if (!(mtd->flags & MTD_WRITEABLE))
>> -             return -EROFS;
>> -     return mtd->_write_oob(mtd, to, ops);
>> -}
>> +int mtd_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_o=
ps *ops);
>>
>>  int mtd_get_fact_prot_info(struct mtd_info *mtd, size_t len, size_t=
 *retlen,
>>                          struct otp_info *buf);
>
>
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
