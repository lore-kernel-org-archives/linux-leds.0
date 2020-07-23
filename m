Return-Path: <SRS0=tL0n=BC=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2470C433DF
	for <linux-leds@archiver.kernel.org>; Thu, 23 Jul 2020 13:47:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FA7120759
	for <linux-leds@archiver.kernel.org>; Thu, 23 Jul 2020 13:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="NZ8AVwkJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgGWNrK (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 23 Jul 2020 09:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgGWNrK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 09:47:10 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBF2C0619DC
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2020 06:47:09 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 4DFC41409FC;
        Thu, 23 Jul 2020 15:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1595512027; bh=iIBXCmI8HiPwN4WptcgezNrFXKWULMHMrOSqV3NtcRw=;
        h=Date:From:To;
        b=NZ8AVwkJt4ujvB5sQVdCX1pTc2eXinAZT+e7XZ7+P4Ddl4P4C3vslyqMajO3Nl+i0
         BJ8R/WHxrTA31CaMwVDXhiya2eMVupC/pdd150O7G16urh+o2sNny3zcFmMgDqA9fp
         h6dLE1Q3ZWVlN8yx7m9Bb9BO0dBCvEiHpmEkvKjc=
Date:   Thu, 23 Jul 2020 15:47:06 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: add orange color
Message-ID: <20200723154706.7aa41188@dellmb.labs.office.nic.cz>
In-Reply-To: <1a8a489b-95e0-58a6-5454-1c45a7ef156c@ti.com>
References: <20200723125751.4045-1-marek.behun@nic.cz>
        <1a8a489b-95e0-58a6-5454-1c45a7ef156c@ti.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Jul 2020 08:40:09 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Marek
>=20
> On 7/23/20 7:57 AM, Marek Beh=C3=BAn wrote:
> > Many network devices have LEDs with green and orange color, instead
> > of green and yellow. =20
>=20
> Can't we use amber?
>=20
> Dan
>=20

:D

Dan
1. amber is different from orange (according to wikipedia)
2. many technical people know the names of at most 12 different colors,
   amber is not among them
3. i can't even find the translation of amber to slovak language :D
4. are you trolling me? :D
