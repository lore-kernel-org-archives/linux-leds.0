Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E77C77B73
	for <linux-leds@archiver.kernel.org>; Thu, 20 Apr 2023 10:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbjDTKNv (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 20 Apr 2023 06:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234159AbjDTKNT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 06:13:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F403F2703;
        Thu, 20 Apr 2023 03:10:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 906FB60A5B;
        Thu, 20 Apr 2023 10:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B2DC433EF;
        Thu, 20 Apr 2023 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681985452;
        bh=7gcE5M0N0YugjmEq67FIL22xQIXPMMXaSduK+QcmS40=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gf2sgwDOuKf/lqficly6iQeQKq54OItkDUkGnCTaFHXn2FQbD93NhVEVL7RAP/6r0
         7mQ5HGcSBzIPvIEjIiU0MFv3nsqdVRnLD3PpT6N5C7kNu0Zm9HUloe94+yDtSb+uZ7
         ttB1nbz8c5qdRE527cie+C1KXJKsuqBHTUWON8W68TqjI12X9oXJG4R76axtdq90Ax
         fZRC5RWtjYtXkZV7jkPdp96NXIJ0rwOB6wkrviZSglFdZKBHj45icFo842oabj3dQf
         RRdsIzsjdt1mVsiJwToYV7DwdRL8IUH9YqrjDdmbTEbb/3gTBdRhTcGj6CK/Fpyy6G
         PWtrdj5BQHYVA==
Date:   Thu, 20 Apr 2023 11:10:46 +0100
From:   Lee Jones <lee@kernel.org>
To:     Anjelique Melendez <quic_amelende@quicinc.com>
Cc:     pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] leds: rgb: leds-qcom-lpg: Add support for PMK8550
 PWM
Message-ID: <20230420101046.GF9904@google.com>
References: <20230407223849.17623-1-quic_amelende@quicinc.com>
 <20230407223849.17623-4-quic_amelende@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230407223849.17623-4-quic_amelende@quicinc.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 07 Apr 2023, Anjelique Melendez wrote:

> Add support for pmk8550 compatible and lpg_data.
> 
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
