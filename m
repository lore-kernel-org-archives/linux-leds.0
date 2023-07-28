Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91724C0015E
	for <linux-leds@archiver.kernel.org>; Fri, 28 Jul 2023 17:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbjG1RNt (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 28 Jul 2023 13:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbjG1RNs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 13:13:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E229835B3;
        Fri, 28 Jul 2023 10:13:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 80F36621B2;
        Fri, 28 Jul 2023 17:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1826C433C9;
        Fri, 28 Jul 2023 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690564424;
        bh=8jOEcDtR4P/VEmWU6mWv6KKs9K0+WVztPFKU+SX9wY8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=twxyXrhrzk1BnDKik0meHUUrOyYw64XrMsPj2HSOzJNHDg8KmHEYrNmf9sXef3jju
         Zn7i7nZ13LSJZdQcwvmTz5aZs3LbLHjfoeP9xZceWZh5QcvHVzzkoMjgXWMoTy2l3P
         DjxdUawWkneYxbikWWlcf4QrTn0PqnVgPk5SeB4DllL56CxT2XThLuy8Wquhj3BxV+
         P7rDW8E7cerr89S1/zqMwf3THbw9nW1qhlVo5P4fMGwwT22QQL/yjVGf2F1CYCCq73
         O4RwkqZF4zmjI2YFldhYSEOUsfIcwagfw6NctcILEdvBHPPkLDCktJQOPUXTG6aNet
         U6QkAatBiRGoQ==
Date:   Fri, 28 Jul 2023 18:13:40 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: rohm,bd71828: Drop select:false
Message-ID: <20230728-appliance-dragonish-d7797ede0714@spud>
References: <20230728171123.110489-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sQ1fJXPiha6T4l2f"
Content-Disposition: inline
In-Reply-To: <20230728171123.110489-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--sQ1fJXPiha6T4l2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 07:11:23PM +0200, Krzysztof Kozlowski wrote:
> select:false makes the schema basically ignored (not selected for given
> compatible), unless some other binding references it.  It's not really
> useful nor needed for device bindings, even if they are part of other
> binding (like MFD).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--sQ1fJXPiha6T4l2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMP3RAAKCRB4tDGHoIJi
0tikAP4ojlR80hxg5PYiZ0FfcWhqoK1g6svO3uqV0pUUmpUWwwEA5+gd/sTbuhmQ
1rrzaN3gH32xc0bSxA5+WVRbGgMv4QA=
=a/QB
-----END PGP SIGNATURE-----

--sQ1fJXPiha6T4l2f--
