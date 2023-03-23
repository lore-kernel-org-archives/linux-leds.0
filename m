Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B451C6FD1D
	for <linux-leds@archiver.kernel.org>; Thu, 23 Mar 2023 11:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjCWLuI (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 23 Mar 2023 07:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbjCWLuH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:50:07 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC8F33CEF;
        Thu, 23 Mar 2023 04:50:06 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 474C71C0E49; Thu, 23 Mar 2023 12:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1679572205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DY83QAZQw5kUe+16Ng7xHTEhGCMXTIZOkSKtvBVBUg4=;
        b=k3lCviQk17KsxkKHNZ5ZI93eus5JaBZAlewxboc8tkW7KFWQ5d7XKkIMUIcHio8RZUDLcm
        VVJ6zHbxgo7QhV6pL/hOL/gR/S/sO0i/bFf22hfTGVTAXyeyVI8furCzVI6RpoYczoP+/X
        ZwO9Bg62a4znuhTnS7t+MkdVyfJEA1w=
Date:   Thu, 23 Mar 2023 12:50:04 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Fenglin Wu <quic_fenglinw@quicinc.com>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: flash: qcom: Fix a signedness bug in
 qcom_flash_register_led_device()
Message-ID: <ZBw87CiRq3n1fejy@duo.ucw.cz>
References: <20aeda89-7ed2-4dd8-b707-404a15289fbc@kili.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VMEU4ToRKenFzn4N"
Content-Disposition: inline
In-Reply-To: <20aeda89-7ed2-4dd8-b707-404a15289fbc@kili.mountain>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--VMEU4ToRKenFzn4N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This bug is basically harmless at runtime because of the surrounding line=
s.
> Still the fwnode_property_count_u32() function returns negative error cod=
es
> so storing them in an unsigned int will not work.
>=20
> Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module=
 in QCOM PMICs")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

But I don't believe we need it in stable.

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--VMEU4ToRKenFzn4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZBw87AAKCRAw5/Bqldv6
8qhtAJ42vKAF1p7Yx0zNTTC880KKM5GbbQCfbllvIW3DghGMtYOrZyyocLP820c=
=AgjA
-----END PGP SIGNATURE-----

--VMEU4ToRKenFzn4N--
