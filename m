Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB546EB64D8
	for <linux-leds@archiver.kernel.org>; Wed, 21 Jun 2023 17:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbjFUR5t (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 21 Jun 2023 13:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjFUR5e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Jun 2023 13:57:34 -0400
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3220273F;
        Wed, 21 Jun 2023 10:56:58 -0700 (PDT)
Date:   Wed, 21 Jun 2023 17:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1687370178; x=1687629378;
        bh=wHGz+4iR1yJG9gev8O3hnv7/wXS8nRLc1LqeNaYELLY=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=C1t7orL4szd8vpbKBwn3Elu1XUCxBcxpLieV4Lz2uU2B5139AlxRAPyHQ1L53omPn
         5N7m5AmgqctYsTY1+OdnHrdwF5w1+JXSi5t3wK1m7ILC1sPT4J4ngrUSMMKOLP6OUD
         /hneIEimXPWLdi/F4bEzbqkC3wAzZ/DRkMRRqkxJ+3KDUZwoBSJVPfDEq7xRzX1+qF
         +cd+j/q67IpSrwUfwyUBer3AyA33ecn5kxqgn8VLoGVyjlq/9QLqEdBuDWwt3XuvAX
         bZ3X/qZroBN8QSCpPrSDqGxECj9OWSYI6k5SXaPQ4jxLTpdu1lE5uN4hmIJ8d/p1dK
         Cq4BdDZ+3HVZw==
To:     lee@kernel.org
From:   Raymond Hackley <raymondhackley@protonmail.com>
Cc:     devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        luca@z3ntu.xyz, pavel@ucw.cz, raymondhackley@protonmail.com,
        robh+dt@kernel.org
Subject: Re: [RESEND PATCH 1/2] dt-bindings: leds: sgm3140: Document richtek,rt5033 compatible
Message-ID: <20230621175600.1209-1-raymondhackley@protonmail.com>
In-Reply-To: <20230621150141.GE10378@google.com>
References: <20230602130644.259933-1-raymondhackley@protonmail.com> <20230602131009.260239-1-raymondhackley@protonmail.com> <20230621150141.GE10378@google.com>
Feedback-ID: 49437091:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Krzysztof,

On Sunday, June 4th, 2023 at 10:43 AM, Krzysztof Kozlowski <krzysztof.kozlo=
wski@linaro.org> wrote:

> On 02/06/2023 15:38, Raymond Hackley wrote:
>=20
> > Add devicetree binding for Richtek RT5033 Flash LED charge pump used fo=
r
> > camera flash LEDs.
>=20
>=20
> What are the similarities? Same register interface? Same pins? It's not
> obvious and your commit should clear explain this. It will be also
> justification why you did not make devices compatible.
>=20

There is a similar way to control with 2 GPIO pins, strobe and enable,
which is not described well in this patch set.

Regards,
Raymond

