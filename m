Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FEC25A640;
	Thu, 24 Sep 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250652; cv=pass; b=mlsLyysFoSAhsZaV1hP+unC4AwcyDQszWZxZHtkYnuIDVS7vxWn7DOuyIzS9B+SbsFo7qHrmLKSHhhcecz4KXSMr+wJyzb1fD1uK97n23gmBTAmgEqwTh0X422pNGwahMYUZ0JTQBoSn2LV5sgJ1gItB4pBrcr/UiTQijQySW9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250652; c=relaxed/simple;
	bh=OBE3DDnBkaOQaPj1fILQ9HIb+aNpVy/zxzaDOi92R9U=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aEhXdMV5mQWFjske7UNjSL9gV0RpmqNUrkijzaca81xd0rc9DzHcByoB2MDTJlxqhKDrBjbbVKc/PZTIPEjd1o39uQX2pLHHoF9zW7nTCU1kOCSCqOkWWXX98lk5hhs3mXPsECknLOJtkVTSXAiL9FPbVA92HYSlTXg14FvENjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=fhfz8YHd; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="fhfz8YHd"
ARC-Seal: i=1; a=rsa-sha256; t=1790250626; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eb4oTwY0qutESF5jWcst0rfzmgLxC3QTM8QspvQ/YqsshJfhxAe2eFTSE0+8EemRM8TKdg3Dh7S5YhI7A16MU5KuhCE+Jm6p7P7X7f+UFx16PpuHnn9ap/5DzaA7wblHBVcMfBmFtKw7z1q1EqqOsK8XAq8Rzww2QVgL5YivDpk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790250626; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D4NQbooTCoLIhq89WPjVN+rIbiM7uvx91LrsRqYcNW4=; 
	b=AQ1jxmCxVzzuIQxJ2n1AUq3unj2C2l4PEYAG9RHdLY71b12sKuiCIBP4MUpF++1UFj/YSASpkM8ae2fyIdVUSYLyWSQ4WX66c43Z1XNb2Vu8JbfJ/4/ifGP4Xu0hKJdt+CkTfs7ytoT3M3JySYKAyXBguIazBQGJdkn8zZFt4aw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790250626;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=D4NQbooTCoLIhq89WPjVN+rIbiM7uvx91LrsRqYcNW4=;
	b=fhfz8YHdHX/OEi4ojmi6NPAiQvda1vabHNL3OyzxDDaZj3TyslevY2vCWcIxzplI
	bs59NiehTFQGdEQ9Hjw1N+If4A6kxawSnE/LHn2tdYw3Si4QkHguconWY1sM+3iUiWG
	sSO6rP999I+zNEpqL+FJemy/0jXO9h5gJLF0h+hE1hpQCGSuouZacJHyy8wijYmMuaN
	7WsNfu266PxngyX6ZD08udVqDMqoZnPOQjGtjudrP5npWwslHpgUOoToP7dZZzV8nn0
	1FlEJN90nRj+HK1udqGqMnPEmH7yRa7tL6llSrpO4WnrvtUPYOC39NLrd1Wlb0YnTb/
	KVLkO/tz6A==
Received: by smtp.zohomail.com with SMTPS id 1790250624843672.5058092645202;
	Thu, 24 Sep 2026 04:50:24 -0700 (PDT)
Message-ID: <577cdb9848906b6b2efcfaff2d68f5ef9a769ae9.camel@rong.moe>
Subject: Re: [PATCH v7 02/13] leds: trigger: Move
 led_trigger_is_hw_controlled() to the right place
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
 <linux@weissschuh.net>,  Benson Leung <bleung@chromium.org>, Guenter Roeck
 <groeck@chromium.org>, Marek =?ISO-8859-1?Q?Beh=FAn?=	 <kabel@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ike Panhc
 <ikepanhc@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar
 <vsankar@lenovo.com>, 	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <20260924083709.GA331088@google.com>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
		 <20260921-leds-trigger-hw-changed-v7-2-fe3cdb6dec51@rong.moe>
		 <20260924083709.GA331088@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 19:45:55 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Lee,

Thanks for your review.

On Thu, 2026-09-24 at 09:37 +0100, Lee Jones wrote:
> --- checkpatch.pl: clean (0 issues) ---
>=20
> On Mon, 21 Sep 2026, Rong Zhang wrote:
>=20
> > Currently led_trigger_is_hw_controlled() is placed at led-class.c, whic=
h
> > is not an right place as it falls into the triggers namespace and does
> > triggers stuff.
> >=20
> > Move it into led-triggers.c, and split it into locked and unlocked
> > variant for convenience.
> >=20
> > Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hard=
ware controlled LED")
> > Acked-by: Ike Panhc <ikepanhc@gmail.com>
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v3:
> > - New patch in the series, the dependency of the following patches
> > ---
> >  drivers/leds/led-class.c    | 10 ----------
> >  drivers/leds/led-triggers.c | 19 +++++++++++++++++++
> >  include/linux/leds.h        |  8 ++++++++
> >  3 files changed, 27 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 4259533dafa1..7110bfbe3b83 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -27,16 +27,6 @@ static LIST_HEAD(leds_lookup_list);
> > =20
> >  static struct workqueue_struct *leds_wq;
> > =20
> > -static bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev=
)
> > -{
> > -#ifdef CONFIG_LEDS_TRIGGERS
> > -	guard(rwsem_read)(&led_cdev->trigger_lock);
> > -	return led_cdev->trigger && led_cdev->trigger->trigger_type;
> > -#else
> > -	return false;
> > -#endif
> > -}
> > -
> >  static ssize_t brightness_show(struct device *dev,
> >  		struct device_attribute *attr, char *buf)
> >  {
> > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > index b1223218bda1..bf2543538ed0 100644
> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
> > @@ -7,9 +7,11 @@
> >   * Author: Richard Purdie <rpurdie@openedhand.com>
> >   */
> > =20
> > +#include <linux/cleanup.h>
> >  #include <linux/export.h>
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> > +#include <linux/lockdep.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/device.h>
> >  #include <linux/timer.h>
> > @@ -33,6 +35,23 @@ trigger_relevant(struct led_classdev *led_cdev, stru=
ct led_trigger *trig)
> >  	return !trig->trigger_type || trig->trigger_type =3D=3D led_cdev->tri=
gger_type;
> >  }
> > =20
> > +static bool __led_trigger_is_hw_controlled(struct led_classdev *led_cd=
ev)
> > +{
> > +	lockdep_assert_held(&led_cdev->trigger_lock);
> > +
> > +	if (!led_cdev->trigger)
> > +		return false;
> > +
> > +	return led_cdev->trigger->trigger_type;
>=20
> How does this not cause a compiler warning?

trigger_type is a pointer. Implicitly converting a pointer to boolean via
a return statement is completely valid in C11.

   6.3.1.2 Boolean type
   When any scalar value is converted to _Bool, the result is 0 if the valu=
e
   compares equal to 0; otherwise, the result is 1.

   6.8.6.4 The return statement
   ...If the expression has a type different from the return type of the
   function in which it appears, the value is converted as if by
   assignment to an object having the return type of the function.
  =20
>=20
> This needs to be evaluated properly.

If it's preferred to make the intention clearer, how about:

	return led_cdev->trigger->trigger_type !=3D NULL;

Thanks,
Rong

>=20
> > +}
> > +
> > +bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
> > +{
> > +	guard(rwsem_read)(&led_cdev->trigger_lock);
> > +	return __led_trigger_is_hw_controlled(led_cdev);
> > +}
> > +EXPORT_SYMBOL_GPL(led_trigger_is_hw_controlled);
> > +
> >  ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> >  			  const struct bin_attribute *bin_attr, char *buf,
> >  			  loff_t pos, size_t count)
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index a515f075c29a..46ad2e03e1c6 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -534,6 +534,8 @@ void led_trigger_set_default(struct led_classdev *l=
ed_cdev);
> >  int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger =
*trigger);
> >  void led_trigger_remove(struct led_classdev *led_cdev);
> > =20
> > +bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev);
> > +
> >  static inline void led_set_trigger_data(struct led_classdev *led_cdev,
> >  					void *trigger_data)
> >  {
> > @@ -584,6 +586,12 @@ static inline int led_trigger_set(struct led_class=
dev *led_cdev,
> >  }
> > =20
> >  static inline void led_trigger_remove(struct led_classdev *led_cdev) {=
}
> > +
> > +static inline bool led_trigger_is_hw_controlled(struct led_classdev *l=
ed_cdev)
> > +{
> > +	return false;
> > +}
> > +
> >  static inline void led_set_trigger_data(struct led_classdev *led_cdev)=
 {}
> >  static inline void *led_get_trigger_data(struct led_classdev *led_cdev=
)
> >  {
> >=20
> > --=20
> > 2.55.0
> >=20
