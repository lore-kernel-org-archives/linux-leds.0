Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A64439F89
	for <linux-leds@vger.kernel.org>; Tue, 18 Aug 2026 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787076772; cv=pass; b=p0NjXypsH0wuHs4nfBtRXg0KD4ScMNBQSAmpAtS+kWuZgd7nKdszIEtPeD3iwPWRXkHGL85R47HWZxS3YqwUcTDK0CgBDsAS0WyO1lJyHkpVp/JJM+7Enhvh2HUmcSXwBi4oySm1Xe5IBkmWq043IYo+wFudDE4gohWq+6Kazy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787076772; c=relaxed/simple;
	bh=B+nSapg+VaNPr8DnhnnL7hC/4rF/jenHxFH+cPq0Tb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkfeqcBkr6mx89+TWQ8iE3xeamLkYHsR9GYGVg/o3Oul4n4L7TDcugk+f5KsgHHQrLIArOkl7oGZBN+/jUuCa04DhbePWhKIgJqUiqrwqI8GQ/2YM3kYonJ6KAgk4joRTyEfagImMewg59pTAcGN99gZsDaNXVgnHOY0SWZI7Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cI9EFXIq; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cI9EFXIq"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b015b2d792so191038e87.3
        for <linux-leds@vger.kernel.org>; Tue, 18 Aug 2026 11:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787076769; cv=none;
        d=google.com; s=arc-20260327;
        b=Jc2gtnGrHhHqubUsqYn0YNHx1Yv1PHkqWP5OrK4mdoWHN7WLde0M11piq6FBaRJ8HO
         M6Q0FEwDyC8kQDyKLrfrRqM1SUui3y2MW7jxZO+VtLNx28C65dssjwpYOs9ZTVT7sDv7
         nQaKY8yX6DXTBDRsKKsXnz7f7hj8M3wLtoshU4n1u0JoLByy5ZAcQv/DazyvV7axXpiW
         H0lVyCSB68ZWoT6DnrWcHKCevqyJBp5ruoypXkmuhQiSoWQxI6eQujgMpdrHNVdmXfr8
         c9QjapRPI3wKEpAl4E9j5nBTt3gwaez4E4oczz+fD6g82I6WPkKjq6xweFFkWgfszYao
         lYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+nSapg+VaNPr8DnhnnL7hC/4rF/jenHxFH+cPq0Tb8=;
        fh=JXmhjc8vA/1tR0ptwdboNW4jPtmOUVHsa5LFJ54tFe8=;
        b=bAA9DS0RpCvsx4ImZNCyyTqjGpZVu8+TfczKeCV77kFl8RbEzzxe3w1ahm5MLcdxit
         LyXiKEjLoUNqkBU//5Hz02hc/3yMIK/eWQzIIV4l2fJtQk2eimEq7GhCupqrlTPZ2SNx
         1X0tC2QglJPm49mLJYMy3Ubo4Pw8sLLunIsLYxQDo9GktRnFOe/NgjrvAuYDUd2Gvys3
         fQAQKwSNPIqIvjhJ8hG1me5nIw06A8um2sQZIWzxi9uKdOAjvuJEgdGs17wk+gtLkZ7M
         fT3dVORAcMqtn0Xdj0Balmm6cqfUaYpDHSzsE077Lm0YMLbVRwHwY4ZGj/rI8aC+1i+O
         TCwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787076769; x=1787681569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B+nSapg+VaNPr8DnhnnL7hC/4rF/jenHxFH+cPq0Tb8=;
        b=cI9EFXIqLZtxOwbcPy1n/SwOyM97CkaCGCO32tIyKapOrco9zYL8GSxSqEz+0pdZGl
         eRdXau6DWUtlljJX5siu+Qa4bBcPCG2x78BsZc/yP3+b9T8627tXDp96yST3gpI5hvZj
         caDeUzz8f5mECkDvRl3hldBuC/OB7cRpdQoNHql5Kr6EiWVncMXq8di57OMtoeMBexNt
         YG9n/9LxlrQKTaFLS4JgSd+h3XKqo0PrpL9w6SClRm4TrP3HGB+bmyC5bInfa9fMZ/vg
         J8c1uHVEz2GO5NlDvOb6H4HpGMNfjXOhzQLinkPd0kTG5qQOn23C2UQ7MuzDFev2+ayU
         hdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787076769; x=1787681569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+nSapg+VaNPr8DnhnnL7hC/4rF/jenHxFH+cPq0Tb8=;
        b=s65vdwn4hGaOxWCAZKFwxr5Ts2w7tizmp0ut5TJkOyNgOGODcSd26CSDJjGPnrEQZx
         m8/hsLR5uRqv247BL3CkAe17ZDS0Lib2mtr8vb1r0bdLhKETa8e9s2gfJiAzEXP6DyGR
         IhiqNe4sshWj3rJwhHH6OfFwC87syIQo4Zii+BfCtWNuuiDvTfcFsZiRCwW7dUJAdGYw
         H3uobxgFOC1MZIxX/PYFZw2QcB1VuywuJjRNwxTv+vv4YuTL2W2GGVhLccdiBtppoiDT
         9G8ZGy8EbKoaXYK7cR85Uhc563Ow3tgnXIbuvMix2lrzeXaICq0wFjcEh1Roco17I3hH
         D+EQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFzE/r46bu6qYGvtaohKsjn1Wc5pMaUXKiAVqYHsiHrznh6vwj3RFXEt9yj+Dq9On2jPtDKVZ5NAwN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw29TjxVdbs0kiG3EuEOJjklllEe7/PLVeCtBKJkolX4BwtoEmT
	RSChBu+U8gDo6ZP+FmNuHtJjzrKF1QMKeOcly0YxiS9tMoHKw92rwlE3m84BYjCvblU3ynLP5mG
	4xoX/+EEt5n/hiqa88XQ+PFj2iYjykDI=
X-Gm-Gg: AR+sD109ivqtMRPBVS9XzPb/D4ZIvkr5R3cWo1QkUEpBKa+b/RlEh1LBlb4aJB9FlZB
	qCaDGLe4m+chl4CSqa6MaG8QQJMoj2Cfl6QoeB06sFrYakewU+giJ1Wg94MB2WLk+4y+ItwHvEd
	xVmNTzNFBApek9+ov22gTazvAk1cy+gy1ixtT9SwGmyTlTJfjd9jI86wqO9/8bbLoy6RpUbxxX+
	zWjkmWFm3Ut2Qx2aFzVAEq5/0IghBFzfi0MZt3T1JzRVf1pqwNKTahde64U4hrSjI3s3SLk0csH
	bDsdt/vBWuOtEg7kvOSgNkKqpeWFLpCWTWJPUgnbtKQth+qR5zshVLCJoyhLfuHHEE/4QkuRPS/
	9+HlEYZOQBWyvobkIIUdyRfHMpg==
X-Received: by 2002:a05:6512:10d6:b0:5b1:5ab5:ea09 with SMTP id
 2adb3069b0e04-5b477c6091emr111830e87.0.1787076768577; Tue, 18 Aug 2026
 11:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786746757.git.ahmadexp@gmail.com> <20260818095654.5357db1d@kernel.org>
In-Reply-To: <20260818095654.5357db1d@kernel.org>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Tue, 18 Aug 2026 11:12:35 -0700
X-Gm-Features: AcwNN1VFdbc7wToCDqu6OVpR2tD_blBihPQ30U0mvdmP813mFMsjtyFeEMH6kL0
Message-ID: <CAOQiBWM57ZBafMcj9MaegHBuM21313O5PqAAGXdHfvmHxHp48g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/7] ptp: ocp: Add R4006 and V9 I2C peripheral support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Nam Tran <trannamatk@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

These RGB LEDs have been part of the Time Card hardware since the
original design, beside the four SMA connectors and the GNSS inputs.
We never had the opportunity to add Linux driver support, so they have
remained unused under Linux.

There is recurring confusion about which logical SMA number
corresponds to which physical connector and how each connector is
configured. The LEDs address a similar operational need to ethtool -p:
they help an operator correlate a logical interface with the physical
connector. Their colors can also represent the SMA input/output
configuration and timing status, together with GNSS fix or lock
status.

This series exposes the LEDs through the standard LED class, avoiding
board-specific raw I2C commands. The generic LED controller driver
provides the standard interface, while the board-specific status
policy remains outside that driver. The second GNSS LED supports the
card variant with a second receiver.

I should have stated this existing hardware and end-user use case
explicitly in the cover letter. I will add it to the next revision.

On Tue, Aug 18, 2026 at 9:56=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 14 Aug 2026 16:10:48 -0700 Ahmad Byagowi wrote:
> > Add the generic LED and I2C-mux support needed to describe peripherals
> > behind the FPGA I2C controller, then use it to instantiate the R4006 an=
d
> > Time Card V9 board topologies from software nodes.
>
> Ahmad, could you explain why? What are you going to do with these LEDs
> as a end user?
>
> The influx of the LLM generated patches has a hugely negative impact on
> the community.



--=20
73
With best wishes / Mit herzlichsten Gr=C3=BC=C3=9Fen
Ahmad Byagowi, Ph.D., Dr. Techn., P.Eng.
Phone: +1 (650) 924 6653

 Please consider the environment before printing this e-mail.
