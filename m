Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBF4C77B72
	for <linux-leds@archiver.kernel.org>; Fri, 14 Apr 2023 12:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjDNMqT (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 14 Apr 2023 08:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjDNMqS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Apr 2023 08:46:18 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0D311C
        for <linux-leds@vger.kernel.org>; Fri, 14 Apr 2023 05:46:17 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6D1C51C0AB2; Fri, 14 Apr 2023 14:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1681476376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=G0Lha5q4ZQx6V+g8lfG4oRYJcUPpp4WZvV663yGb8q0=;
        b=nwllDPLYP720as77gnx3cSP7v83QUDan60NFeMBhuxb+67H+aqemnYkC5ybslKft/6QU+b
        xArTOT6rFY8y2cz6te/nkn5Qx2S6+Rk1+raipHnsICTrCo5gFd/2wGLR84PwxRAfFWyq8J
        EOX52gVxqzUxp94aM54JxyFqPFS8uOk=
Date:   Fri, 14 Apr 2023 14:46:15 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Lee Jones <lee@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/5] leds: cht-wcove: Add suspend/resume handling
Message-ID: <ZDlLFwaNyrlMdH/p@duo.ucw.cz>
References: <20230413151808.20900-1-hdegoede@redhat.com>
 <20230413151808.20900-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hTfRUAid0SBqpWIy"
Content-Disposition: inline
In-Reply-To: <20230413151808.20900-3-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--hTfRUAid0SBqpWIy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +
> +/* On resume restore the saveds settings */

-> saved.

Acked-by: Pavel Machek <pavel@ucw.cz>
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--hTfRUAid0SBqpWIy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZDlLFwAKCRAw5/Bqldv6
8t7NAJ0dOGDIXoMppVEKIpSo4E4Os7GctQCY3eoUgBLehK0P18Jo03bhBj10pw==
=gNgH
-----END PGP SIGNATURE-----

--hTfRUAid0SBqpWIy--
