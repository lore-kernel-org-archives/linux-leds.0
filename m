Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7C439A058;
	Thu, 14 May 2026 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760196; cv=none; b=JYzRm5f3aUe8KLA4Nz4dsxHnfg/rr7SjU8VvgxpcDea9Q7sk03tECaJZrpP5WccEkCSKu89iRFPLUU4HIrESsgEGkdPDGYRDi5ZV8yzYnmo8m3kp/owLyMKeiz9kz/+JBYS/KfBE2W31ThF0KyCoM13wqaUQmkAp+0JIjzq3Bls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760196; c=relaxed/simple;
	bh=UYHecIJq8Lz+mIcHZehAgi91My/BeGtx6kMKmKh1dAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c5auwnMW3DK4+m9JoTnOPR52oAxBpRqnTVA46YyznOAfgSq+XzOMgfTiEFizSqvDNrJdnduYsH8C0wraJY6oC3tZpgbxC9NCN+Sa9e8/F83VqjwVE8Vo9HUk5RtFDIoWvmKxu4nkP4HF50tudDPkKaIqBNM6nsVuoqc3sNBTOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOY3Nlwn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOY3Nlwn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C62DC2BCB3;
	Thu, 14 May 2026 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760196;
	bh=UYHecIJq8Lz+mIcHZehAgi91My/BeGtx6kMKmKh1dAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iOY3Nlwn9M7qTQ506qgNk1zgij/TovMVK2v0uL/fIQJsr+HuNF4Q9eVosoHURF3fm
	 glo6XhMHZEVMh+h5NcK79/zgXblzYtUBGT7csuW7/GXtqb2rSBUbd/dUqDBc3Muqcw
	 6CIsS+zfiawfPmKPi1gfZVEa5qtg8ifBVJARsy20rrnGSRgStJhHZhRnI7cAA82cPz
	 bYNNo+utte4SVNxb/a8cAOF+5IgVGmzWE4PBj0cCH0iK18bPP8JFsq2W0HLNZ9vyFx
	 JJrrLNd29puTfG6T3yuEUPxAsSTkhFtxNIB6nGw/XqLdoP+jUXQBwOH/QSCSJw+0T/
	 Rem5C8btksvYw==
From: Lee Jones <lee@kernel.org>
To: jansimon.moeller@gmx.de, Stepan Ionichev <sozdayvek@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260504123730.1094-1-sozdayvek@gmail.com>
References: <20260504123730.1094-1-sozdayvek@gmail.com>
Subject: Re: (subset) [PATCH] leds: blinkm: fix spelling and comment style
 above lock acquire
Message-Id: <177876019491.2684794.1574797289559940851.b4-ty@b4>
Date: Thu, 14 May 2026 13:03:14 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 04 May 2026 17:37:30 +0500, Stepan Ionichev wrote:
> Fix two issues in the comment above mutex_lock_interruptible() in
> blinkm_transfer_hw():
> 
>   - Spelling mistake (Aquire -> Acquire).
>   - Trailing "*/" was on the same line as text; move it to its own
>     line to match kernel coding style.
> 
> [...]

Applied, thanks!

[1/1] leds: blinkm: fix spelling and comment style above lock acquire
      commit: fbc62317dd6476260df09994729898eb523344a9

--
Lee Jones [李琼斯]

