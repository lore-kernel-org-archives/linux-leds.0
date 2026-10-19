Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392594E06DA
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407991; cv=pass; b=ieh4QnYk8jXh8jsb6duXY1sIMDTQF9aFfmrL6TKPYNdstEFJ52fuqzhzbw7ma+ZQLHQqvrY+Lhfw3pBMNq0mARtsRdNue8y2CG1sSXWwg7+YNNPNSoowDD5sepsQKe/QUUVOz2J7vNh76dtwq0Cz0rPy5o8Q0cy56lLZbp0Ib7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407991; c=relaxed/simple;
	bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bm5sFmeMYEx3cR4oToYjaCrZajmguEXjEu991BB5QEVDtrAoxoVid8Q3UFDFEuryiswjAD/Nldg6YAHHympONzIMToAFqDd64MGzkorr5z6fVKRqii0J8485pOUXtmf8ymy9wjI7wnPo2jKRMNIZh8iz7gtl95mg1sjPkjtWv44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=royPCape; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="royPCape"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6798eb0d13fso1326842d50.0
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 04:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792407989; cv=none;
        d=google.com; s=arc-20260327;
        b=EZjvXWRTg0C3UT4I07tnf3gbxt9coVrnRSf/yb5JTlS5QUH1x/FDtDMxZOa5iGq5kE
         e5T2yO/mBmwjfsjdqt5MZAXViGh/HvidVclZzTJUSj2A5uP0DobBOJ6ZiED6ZajBS2ld
         1dQlvQB0yuhoCaLCxAaBzMCE1nzcRLKdLN+5GaCW6y4sf760tqRP2LAn/gj+ETcPpIy9
         kZmH2nJz3I02mh6qN+KDaLI719xUqML/9fGRPFyRdb0rTbVJ7sE9+sf2UeaWeAmB+VTH
         5YhoG68mt1gg8qnm0zi8xYTUCgd6aGQVi4HbjQ3QqBo0kfouOvTfIzcH33niUUyPl5GY
         urMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
        fh=lOc87nSNJ//35eeIv6NNh+5t0kwD7LcPE5RKeOPjqEY=;
        b=MvQ9mIhzGdFiMnDw8JIYKIchlhY/2OXI2r9w5tZakJu8PTyjtz8HzqTfivHjQ34dyR
         hyadh6HkHEIqk+KR+9YcMUaO1ufRSXTgvyMdxoYElRY1OidFRaQcvWlF2G74HBGNU1sD
         8Ij89XnA0rSuXBJGZ1p++iHMW20/TlQ8t5710XsK0Sevwd7L74cil5gR0/6/tuiqLYSx
         lHXL6cvFAlNMD51m1wbm6x2AwAcB01NyAYpG9ueV+1eFgCpZJ11hDF03p6UevBiLH6as
         s08vECizEZjDHebHyYg+3qBRe0udczyplGHNRUp5BlkLpyNuCtNgw9w3AY9iyJBP/Gju
         gOOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792407989; x=1793012789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
        b=royPCapeeg/TQgjtdyW6XI1Z3Y9e0kRCaONDaRN4LR9+5/t2f+H0XhtfNxbSsaAPSZ
         7i3m8d7zAS5+SENiU/wHZU2/Te3ph1w8kjCx19pE0D++Xt3XA6TtH0yu9xuJIlS9MpKA
         q2o4pB+JXo499xZg3jH9iivZgQH1EFi2QlrvuHZPxqp2IwMTVSEUj/JSbrN8kADmBlYA
         5JfLtbg1dRt6PlOBtRpDvYrISOrrLEGMV9wSQ2T2gKTQrNT+WD+PLc0y/l5ZlHXGmCS5
         ULU6yinAJQlOC8/TC1Lg+Q2LMxFj7MrJp4+0qF2AEfNPsK6sXkpZ+ejwMsDUyKWBZiGa
         0XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407989; x=1793012789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
        b=rvqHPFgsK9dhB+bz8yWU+urQKxy4GXcyarhZRFrT8VYaTHH69kli+xaAhVZ4UG0kQP
         RrVBHHv0tTMphRBni0QTt9xYvYf0sTtRxk9M1K81i0LLrwmLGm2Ictj9BN5YR7hKc6Oi
         TddOf3Koc3WgcUc3Km57m8WlsH89Me1c84XYPedGTJS6tnHgqNRh97QtLNst6IVh7RCE
         HSnFSL25CybqzomhH0TTPWdVDif19Ic8tkIvPUou1s/Sa+P+TotEjEBD52bzh28RteAl
         4fFYCsre/2GxJIWdkotb/isfdVneAHAFTjRaryZEPF+39Mhk7SnVDA27lGuKafUx3zpt
         myzg==
X-Forwarded-Encrypted: i=1; AKwUvBw/eTFVENK52x4V1y0Sxi4A8lnqpp9zZP5KKjBPcb0Y20tHjKyhXyjFPKupZnkVkDGc86ynAmtkR0eX@vger.kernel.org
X-Gm-Message-State: AFq9FYKu4TNolapUP6NkodAKcQSyF9BuiJ9nGtUF+wxVG70/ONwMvuLr
	QuuFel1ZtjcZpJS0UJahzEfY5mITixY7TBJBOw0oQ1hjClXp0/DeBIeQ0OKYJ7sfE+81iKHGfUy
	8I50Z4q7iYjhp0YZwY+nY9iO9nGztI1Y=
X-Gm-Gg: AYBFou0124leN9yqm0msOIRE5IQ16ZFPCjdrt/zfbW53wHGbpTq85OPRxVla49fiyWQ
	Dkq+YZaST/VzusPAbGh4vlthLmYpXzfeKVOr85Nw7sSwzjt/m3l/0tC6y2/i9b+vdxc1rXsgD7G
	htVmPWtlUivwIMTZQVd2GwINm60/UZBi0pftICU4QZiiNFVMvWptuPC38ZeK0m2dCEozZ9sTvrQ
	K7uM37V8Sbc5EW/1RS01ZWtwWMN1ifQ6+7buPT3i735l9tUVgq79Bp9lCp1auDhCViWp2eFkp72
	viTWOlm0cSjb326/sTmwXtbSRHpnqbAzAY/hX26TL6Is9/vSLlQGYIyt3p2Ex4PliKJh23lV97E
	HsuWjT4vKjKkZ38JN+51Ye0jZJrdTcHMWEQze9U0gPFiR5HnKZScvN66BBV3qsL8Ihg1DWCIBWL
	KxoYszjA==
X-Received: by 2002:a05:690e:4004:b0:676:e85e:5ec with SMTP id
 956f58d0204a3-679ca93e9c2mr2047972d50.139.1792407988921; Mon, 19 Oct 2026
 04:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016162912.64581-1-lukapanio@gmail.com> <20261016162912.64581-3-lukapanio@gmail.com>
 <atX2Sf4GJNFYq2ZY@aspen.lan>
In-Reply-To: <atX2Sf4GJNFYq2ZY@aspen.lan>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 13:06:17 +0200
X-Gm-Features: AclHuK9BPbEV3xXNig3O4K-KotL1JMndrdN2hrEB4vNyiT7qjydGuoSSOSI_klY
Message-ID: <CACi=Ov4qxW_HmgcjRJLg3SWGKd2S+3rcevjpp8ELf6z7RBP3qw@mail.gmail.com>
Subject: Re: [PATCH 2/2] backlight: Add Awinic AW99703 backlight driver
To: Daniel Thompson <daniel@riscstar.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, pavel@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, deller@gmx.de, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, Oct 19, 2026 at 12:51=E2=80=AFPM Daniel Thompson <daniel@riscstar.c=
om> wrote:
>
> On Fri, Oct 16, 2026 at 06:29:12PM +0200, Luka Panio wrote:
> > Add a driver for the Awinic AW99703 3-string WLED backlight controller.
> >
> > Register values follow the AW99703 datasheet (V1.6), the structure
> > follows the aw99706 driver.
>
> Given how much the structure follows the aw99706 driver I'd expect there
> to be more code sharing between the drivers.
>
> Cold AW99703 support be implemented by extending the existing aw99706
> driver?
Thanks for the review. The register maps differ completely (chip ID,
brightness split, enable bit, current range, boost options), but the
driver flow is the same, so I'll turn aw99706 into a per-chip-data
driver and add AW99703 support to it in v2.
>
>
> Daniel.

Thanks,
Luka
