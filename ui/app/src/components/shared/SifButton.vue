<template>
  <button class="btn" :class="classes" :disabled="disabled">
    <span class="content">
      <slot></slot>
    </span>
  </button>
</template>

<script>
import { defineComponent } from "vue";

export default defineComponent({
  props: {
    disabled: {
      type: Boolean,
      default: false,
    },
    block: {
      type: Boolean,
      default: false,
    },
    medium: {
      type: Boolean,
      default: false,
    },
    className: {
      type: String,
    },
    primary: {
      type: Boolean,
    },
    secondary: {
      type: Boolean,
    },
    ghost: {
      type: Boolean,
    },
    small: {
      type: Boolean,
    },
    nocase: {
      type: Boolean,
      default: false,
    },
  },

  data() {
    return {
      classes: {
        block: this.block,
        medium: this.medium,
        primary: this.primary,
        secondary: this.secondary,
        className: this.className,
        ghost: this.ghost,
        small: this.small,
        nocase: this.nocase,
      },
    };
  },
});
</script>

<style lang="scss" scoped>
.btn {
  @include resetButton;
  position: relative;
  display: inline-block;
  height: 30px;
  padding: 0 18px;
  overflow: hidden;
  font: inherit;
  text-transform: uppercase;
  font-size: $fs_md;
  line-height: $lh_btn;
  letter-spacing: 1px;
  border-radius: $br_sm;
  transform: perspective(1px) translateZ(0);
  cursor: pointer;

  &.nocase {
    text-transform: none;
  }

  &:not(:last-of-type) {
    margin-right: 0.5em;
  }

  &:disabled {
    cursor: none;
    pointer-events: none;
    background: $c_gray_400 !important;
    color: $c_gray_800 !important;

    &::before {
      background: transparent;
    }
  }

  &.primary {
    color: white;
    background: $c_gold;

    &::before {
      content: "";
      display: block;
      width: 100%;
      height: 100%;
      position: absolute;
      top: 0;
      left: 0;
      background: $g_gold;
      z-index: -1;
      opacity: 0;
      transition: opacity $trans_fast;
    }

    &:hover::before {
      opacity: 1;
    }
  }

  &.secondary {
    background: $c_gray_100;
    border: 1px solid $c_gray_200;
    color: $c_text;
    transition: background $trans_fast;

    &:hover {
      background: $c_gray_300;
    }
  }

  &.ghost {
    background: transparent;
    color: $c_gold;
    border: 2px solid $c_gold;
  }

  // sizes:
  // block spans the full width of parent

  &.small {
    font-family: Arial, Helvetica, sans-serif;
    letter-spacing: 0.5px;
    font-style: normal;
    font-weight: bold;
    font-size: 10px;
    padding: 2px 5px;
    height: auto;
    line-height: initial;
    position: relative;
    top: 1px;
    &:active {
      transform: translateY(1px);
    }
  }

  &.block {
    display: block;
    width: 100%;
    margin: 0;
  }

  &.medium {
    padding: 0 30px;
  }
  & .content {
    display: flex;
    justify-content: center;
  }
}
</style>