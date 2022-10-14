Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08881C4332F
	for <linux-leds@archiver.kernel.org>; Fri, 14 Oct 2022 13:05:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJNNFs (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 14 Oct 2022 09:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiJNNFs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Oct 2022 09:05:48 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183242A24C;
        Fri, 14 Oct 2022 06:05:46 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 273211C0025; Fri, 14 Oct 2022 15:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1665752745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=9TRlQOWWegS83pe5Ve1QmWfEX50i/wCXwds1kTs2jhA=;
        b=PbV7q3lfA/AYFwLtyb8NkiROnqkkKtUE3fNIhh1beLrnml3lg3hh816V8/7ysXaKusPkZO
        EOfxgwHhd6BqovWkklziVbrnaR+pe7UwNRpOnESyFvnb45N0yV3RVWaM1XgKJn7N64IxUE
        6IgPq8qImGjuC/Pbb2vVDs/UtwiKm+4=
Date:   Fri, 14 Oct 2022 15:05:44 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v6.1-rc
Message-ID: <20221014130544.GA10424@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-6.1-rc1

for you to fetch changes up to 4d1632151bde847230a0bd2318806380d309655f:

  leds: pca963: fix misleading indentation (2022-09-26 23:16:37 +0200)

----------------------------------------------------------------
This is very quiet release for LEDs, pca963 got blinking support and
that's pretty much it.

----------------------------------------------------------------
Bernardo Rodrigues (1):
      leds: pca963x: fix blink with hw acceleration

Marek Vasut (1):
      dt-bindings: leds: Document mmc trigger

Pavel Machek (1):
      leds: pca963: fix misleading indentation

 Documentation/devicetree/bindings/leds/common.yaml | 39 ++++++++++++------=
----
 drivers/leds/leds-pca963x.c                        | 22 ++++++++++--
 2 files changed, 41 insertions(+), 20 deletions(-)

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY0leqAAKCRAw5/Bqldv6
8s1cAKCaZvXwLC+T6kkORuBk04wArQjxDwCgl3UsJuVlon0zN6exh7TnZgl5oqU=
=VqEr
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
