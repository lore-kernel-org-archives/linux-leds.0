Return-Path: <SRS0=GEog=6H=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55346C2BA19
	for <linux-leds@archiver.kernel.org>; Thu, 23 Apr 2020 06:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05BC2208E4
	for <linux-leds@archiver.kernel.org>; Thu, 23 Apr 2020 06:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="ZnFUveIV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgDWGks (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 23 Apr 2020 02:40:48 -0400
Received: from mail.nic.cz ([217.31.204.67]:45872 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgDWGks (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Apr 2020 02:40:48 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id A6CED140BD3;
        Thu, 23 Apr 2020 08:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1587624046; bh=LkuL42hXPzC0mMIZfKgl4PYGmSs0s6vQivfcRSS78lo=;
        h=Date:From:To;
        b=ZnFUveIVQj8s79JTSSHlALtpN7XAKdI5+MuUx/4RJi/6B/3nrYbTFIgN3ePd3G7P7
         9LQOR0cbP/3iE+igOHaiNEzmmtDJ1O1/WvOetQsjGSTR+7sqNTR2VFn7Qz0wPlDlzx
         jB52RXW5L17VXcH8h+3uO9105wryr6qOS2F+9YfI=
Date:   Thu, 23 Apr 2020 08:40:46 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200423084046.453262a9@nic.cz>
In-Reply-To: <20200423063552.GA22554@amd>
References: <20200421171732.8277-1-marek.behun@nic.cz>
        <20200421171732.8277-2-marek.behun@nic.cz>
        <20200423063552.GA22554@amd>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Apr 2020 08:35:52 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
>=20
> > Add device-tree bindings documentation for Turris Omnia RGB LEDs.
> >=20
> > Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> > Cc: Rob Herring <robh+dt@kernel.org> =20
>=20
> Rob already reviewed this one. Is there reason not to have his
> reviewed-by here?

This one is written in yaml, the previous was .txt

> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2019032819=
3428.19273-3-marek.behun@nic.cz/
>=20
> >  MAINTAINERS                                   |   5 +- =20
>=20
> Please put MAINTAINERS change into separate patch. I don't think I can
> merge it throught the LEDs tree.

Ok, I shall send it to someone else then, probably Gregory.
