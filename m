Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66B3388396;
	Thu, 15 Oct 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079627; cv=none; b=F8S3E1o7H7WXwq60/iSlsjXwVFmQOdqX/hvsIlmlZWh5mpDTHcOScUoBgV+VOglBs/3wRIl2k8l2drtW/aVVgWn+2HzoX9YbSP3nDZIoifX1CQFUGCIbdkaIU5StqG/h4JcihGaCZOUNWfYtm9SV13Kj7OVYxlAvrC6BgRnnwRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079627; c=relaxed/simple;
	bh=mUKD6ZUmFq4nEn3x9W5ewN8bpJtJZe5poY+akpMs/rY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g9tGb5AozoJLvyW+dkXQ5WGT1Q0cfdEmaW+CdRT2i01bz0ovSSMvZrKogc39et3Ka/WKGMwedX+KoLcgKWybzGGXhiiKUJFTVN1rHlC8gLPaxv7j4yk8BF/z0ybAoHm+RLJp5QBXC+QjhKo6iIEX7B60eOQ1tmyDjdCnixv2pXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhfw5ZBf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhfw5ZBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E731F000C4;
	Thu, 15 Oct 2026 15:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792079615;
	bh=/afKk64hL56JTL0paFCLExJ+3zQc/I8Lqp6QhkvjyZo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hhfw5ZBfTYvNYvo1nLCg3YNQFkImd8lpE/mitlgeLlhDGUFFtfx8CwIRYM4uIpgFH
	 KzqIIi6z7xQ1so2r4SLOnbW5YdFPcsQkhVdIygHDpGe6BJPuvTc6tk2VLSw0vF+ck0
	 Vq6hS/DZpamNIoMhxxzcAqvokMRVACuKc4RjBFF4HRL8RYqBjMWDyRyE2oNcWf5v2p
	 Ffyue4O/Gu+yBdxsFg8qjYOqo37weximpsCwWe03PQVlE+cxR2XODgRhpUtA+VN1vf
	 HNyvU6bFoEG/aHN9PGyjyUTuBgfBtwzlYdc9XOEAVULZolwJoJTAMX5D3VEyL8Abv1
	 pGvEXb38zW7zg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Udaya Kiran Challa <challauday369@gmail.com>
Cc: skhan@linuxfoundation.org, me@brighamcampbell.com, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261005184428.251868-1-challauday369@gmail.com>
References: <20261005184428.251868-1-challauday369@gmail.com>
Subject: Re: (subset) [PATCH v4 1/2] dt-bindings: leds: lacie,netxbig-leds:
 Convert to DT schema
Message-Id: <179207961281.2077374.17554666840589895790.b4-ty@b4>
Date: Thu, 15 Oct 2026 16:53:32 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 06 Oct 2026 00:14:28 +0530, Udaya Kiran Challa wrote:
> Convert lacie,netxbig-leds devicetree binding from legacy
> text format to DT schema.

Applied, thanks!

[1/2] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
      commit: 59cf91cf87abb67a49b1bb7b9d3b06486abde8cf

--
Lee Jones [李琼斯]

