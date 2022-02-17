Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820AEC433EF
	for <linux-leds@archiver.kernel.org>; Thu, 17 Feb 2022 11:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239719AbiBQL0i (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Feb 2022 06:26:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239714AbiBQL0i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Feb 2022 06:26:38 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90936547
        for <linux-leds@vger.kernel.org>; Thu, 17 Feb 2022 03:26:23 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D36FB1C0B85; Thu, 17 Feb 2022 12:26:20 +0100 (CET)
Date:   Thu, 17 Feb 2022 12:26:20 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     gerd.haeussler.ext@siemens.com, linux-leds@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH 2/2] leds: simatic-ipc-leds: Don't directly deref
 ioremap_resource() returned ptr
Message-ID: <20220217112620.GA17283@duo.ucw.cz>
References: <20220117112109.215695-1-hdegoede@redhat.com>
 <20220117112109.215695-2-hdegoede@redhat.com>
 <20220128102907.2bf438e2@md1za8fc.ad001.siemens.net>
 <a6c629fa-1b47-803d-9f16-a0d1df70dda9@redhat.com>
 <20220128162629.27cf98ee@md1za8fc.ad001.siemens.net>
 <86d6278c-3c96-2240-e358-8bda3112fc2e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <86d6278c-3c96-2240-e358-8bda3112fc2e@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Pavel, ping? What is the status of this series?

I applied the series. Thank you,
							Pavel
						=09
--=20
http://www.livejournal.com/~pavelmachek

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYg4w3AAKCRAw5/Bqldv6
8sNnAJ9nr/IVCpct3FLbYHn79Eg1UXHspwCgwJe0xPBhN8i0zIdl9iS7y/EkAcg=
=tmjT
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
