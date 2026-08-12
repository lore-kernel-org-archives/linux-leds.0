Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B790538E119
	for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520994; cv=none; b=igICPoyHKKbTJWCa4hwmB52sZg/cibypiq8Jct24uT726OjQmi44G8rEuHUXDeboal2S92V8mRHtEFa5uF1iCSv82Hr+hHE2uWl2jAwnf43pvVhcwrp9lvo8ZjG45GCNzDBsXDx/KyhwQdNqF+LzW3z8T5XVRco3iMErt11oIYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520994; c=relaxed/simple;
	bh=PDi9YKEuXj5UNZ78Pxf7zKsC4r2wiCr1J4LDEslzgVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6bQ/QFAG7cmxiU33CAQRd3DhgEw8heixe2Velm7V+riOCsG1BqDZ5O13gWY00Xyce/TySxo3orqO2a6w+RHWGh+DKOdbKKBxIpQ0Q9Iur8MG2MA6At6r0PN8qUkZDA4Z8LMhO5hJM27EefXbSUkWMc60VL8H4EWdolqQ2uwhSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ub3rkZiz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ub3rkZiz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228D31F00ACA
	for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 07:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786520990;
	bh=PDi9YKEuXj5UNZ78Pxf7zKsC4r2wiCr1J4LDEslzgVg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ub3rkZiziZGTWCZIVNcq3S5Pbed3EUD4qwTqC/pIPpXLnuPISYvRr0Rhz9ZfprWeq
	 brOO65WS36KfFLu3WVciVRSvWYbWFf+YHa/50NGDslWW2uB1/DnQG9nZPKuQTPb55S
	 TkTG1wcgXoPVF2n4kshs34A6HLV4IeZ6qpoUAEjgT22bJNfdatj80ajPgzyqk3O531
	 D3ae3DvKjWHYB1EahiXWgYuWhHGvcaRNKNVCyKzrU8E/D6RikDXIi8GZiJyNrkSniO
	 Qr+WSd8CinDQBrq11DM60O7ITg+GgWenhwZmQvS8jqsO1oP0ievKOdgabmZ+LtnJWs
	 zFrwZ9vGuJT/g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39eb257e9fbso4235691fa.0
        for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 00:49:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq+EPWXq2UZ0SajPgyk2KVts1ibUQntOyyaYWO9yCNu7yxoaxq16y3URoWRVT5sR11xIjzUVDvTU8FZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzMaTO+BhSM4HdI/hmkgEKD+Ey60iLvW8okQV3NPzgBA8vzU4cE
	1AAd9MPC8M1hDPUpMV00ayWdHEyUReozacz5n6lEdrlvs71kR2TgzINea99BfWSr1QuV9mprM5J
	9Xy+8jFzhI6ZslEI8u0Zso33mbNSE/GE=
X-Received: by 2002:a2e:a556:0:b0:397:e391:c0a9 with SMTP id
 38308e7fff4ca-3a10d4dd322mr2733681fa.10.1786520988930; Wed, 12 Aug 2026
 00:49:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com> <73033a32-4efe-4ed2-9319-ffb205d28719@gmail.com>
In-Reply-To: <73033a32-4efe-4ed2-9319-ffb205d28719@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 12 Aug 2026 09:49:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkc953WROweQ0=BVRmyOMUdqx68XSS3VoBmqfyzbGeCdw@mail.gmail.com>
X-Gm-Features: AUfX_mw4U6C-G9P9EaGKkzSNO-XMtJxNZ4TxODD_mEGcCds37q8U47nyJFp-DAk
Message-ID: <CAD++jLkc953WROweQ0=BVRmyOMUdqx68XSS3VoBmqfyzbGeCdw@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Samsung Expressatt: Camera Flash
To: Rudraksha Gupta <guptarud@gmail.com>, Lee Jones <lee@kernel.org>
Cc: devnull+guptarud.gmail.com@kernel.org, andersson@kernel.org, 
	broonie@kernel.org, conor+dt@kernel.org, conor.dooley@microchip.com, 
	david@ixit.cz, devicetree@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, 
	konradybcio@kernel.org, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, pavel@kernel.org, phone-devel@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 11:31=E2=80=AFAM Rudraksha Gupta <guptarud@gmail.co=
m> wrote:

> https://lore.kernel.org/all/20260527-expressatt_camera_flash-v6-0-de0f150=
024e4@gmail.com/#t
>
> This series seems to have fallen in between the cracks. Should I resend
> this patch series?

Let's just gently poke Lee about it and see what he says.

Yours,
Linus Walleij
