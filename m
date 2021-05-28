Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B64C4708C
	for <linux-leds@archiver.kernel.org>; Fri, 28 May 2021 06:47:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F395613EC
	for <linux-leds@archiver.kernel.org>; Fri, 28 May 2021 06:47:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhE1Gsj (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 28 May 2021 02:48:39 -0400
Received: from lists.nic.cz ([217.31.204.67]:34456 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhE1Gsi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 02:48:38 -0400
Received: from dellmb (unknown [IPv6:2001:1488:fffe:6:be02:5020:4be2:aff5])
        by mail.nic.cz (Postfix) with ESMTPSA id 740C113FEA3;
        Fri, 28 May 2021 08:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1622184423; bh=uT4QTV3+nhYnEZekJ7wQNVwjsem53ut6CKQx7WNS4AI=;
        h=Date:From:To;
        b=DCwHQzP0L+Zh4HOQSNWO9Q4mR6tk5oc1ZT8OQxcvH3zE1svFsOLmq4DDSAiSJmqCw
         zk/xk4NNTBTdtgtPw8dgOeIEaOZ/YM1ZWe7CNEPpPeYEJMpgOPgFRlG/O9gfrktq7M
         Tf50/t+FHO7zD0JuaMAov/8VbHJdBH9tq5b/BSMA=
Date:   Fri, 28 May 2021 08:45:56 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, netdev@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH leds v1 4/5] leds: trigger: netdev: support HW
 offloading
Message-ID: <20210528084556.69bbba1a@dellmb>
In-Reply-To: <YK/PbY/a0plxvzh+@lunn.ch>
References: <20210526180020.13557-1-kabel@kernel.org>
        <20210526180020.13557-5-kabel@kernel.org>
        <YK/PbY/a0plxvzh+@lunn.ch>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 27 May 2021 18:57:17 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Wed, May 26, 2021 at 08:00:19PM +0200, Marek Beh=C3=BAn wrote:
> > Add support for HW offloading of the netdev trigger.
> >=20
> > We need to export the netdev_led_trigger variable so that drivers
> > may check whether the LED is set to this trigger. =20
>=20
> Without seeing the driver side, it is not obvious to me why this is
> needed. Please add the driver changes to this patchset, so we can
> fully see how the API works.

OK, I will send an implementation for leds-turris-omnia with v2.

The idea is that the trigger_offload() method should check which
trigger it should offload. A potential LED controller may be configured
to link the LED on net activity, or on SATA activity. So the method
should do something like this:

  static int my_trigger_offload(struct led_classdev *cdev, bool enable)
  {
    if (!enable)
      return my_disable_hw_triggering(cdev);
=09
    if (cdev->trigger =3D=3D &netdev_led_trigger)
      return my_offload_netdev_triggering(cdev);
    else if (cdev->trigger =3D=3D &blkdev_led_trigger)
      return my_offload_blkdev_triggering(cdev);
    else
      return -EOPNOTSUPP;
  }

> > -static struct led_trigger netdev_led_trigger =3D {
> > +struct led_trigger netdev_led_trigger =3D {
> >  	.name =3D "netdev",
> >  	.activate =3D netdev_trig_activate,
> >  	.deactivate =3D netdev_trig_deactivate,
> >  	.groups =3D netdev_trig_groups,
> >  };
> > +EXPORT_SYMBOL_GPL(netdev_led_trigger); =20
>=20
> If these are going to be exported, maybe they should be made const to
> protect them a bit?

The trigger structure must be defined writable, for the code holds
a list of LEDs that have this trigger activated in the structure, among
other data. I don't think if it can be declared as const and then
defined non-const.

Marek
